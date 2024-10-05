import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathfinder/config/data_sources/remote/swagger_repository.dart';
import 'package:pathfinder/core/network/app_response.dart';
import 'package:pathfinder/core/shared/domain/entities/maze_response.dart';
import 'package:pathfinder/features/problem_solving/domain/entities/a_star_algorithm.dart';

part 'calculations_service_state.dart';

class CalculationsServiceCubit extends Cubit<CalculationsServiceState> {
  CalculationsServiceCubit(
    this.swaggerRepository,
  ) : super(InitialState());

  final SwaggerRepository swaggerRepository;

  Future<void> solveTask() async {
    final result = await getTask();

    if (result == null) {
      emit(TaskErrorState());
      return;
    }

    print('maze: ${result.data[0]}');
    final solved = AStarAlgorithm.solveMaze(result.data[0]);
    print(solved);
  }

  Future<MazeResponse?> getTask() async {
    emit(TaskLoadingState(progress: 0));
    final result = await swaggerRepository.getTask();

    if (result is ErrorResponse) {
      return null;
    }

    emit(TaskLoadingState(progress: 0.5));

    return result.data;
  }
}
