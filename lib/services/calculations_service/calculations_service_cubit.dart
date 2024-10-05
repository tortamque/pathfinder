import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathfinder/config/data_sources/remote/swagger_repository.dart';
import 'package:pathfinder/core/network/app_response.dart';
import 'package:pathfinder/core/shared/domain/entities/maze_data.dart';
import 'package:pathfinder/core/shared/domain/entities/maze_response.dart';
import 'package:pathfinder/core/shared/domain/entities/solved_maze_model.dart';
import 'package:pathfinder/features/problem_solving/domain/entities/a_star_algorithm.dart';

part 'calculations_service_state.dart';

class CalculationsServiceCubit extends Cubit<CalculationsServiceState> {
  CalculationsServiceCubit(
    this.swaggerRepository,
  ) : super(InitialState());

  final SwaggerRepository swaggerRepository;

  Future<void> solveTask() async {
    final result = await getTasks();

    if (result == null) {
      emit(TaskErrorState());
      return;
    }

    solveTasks(result.data);
  }

  Future<MazeResponse?> getTasks() async {
    emit(TaskLoadingState(progress: 0));
    final result = await swaggerRepository.getTask();

    if (result is ErrorResponse) {
      return null;
    }

    emit(TaskLoadingState(progress: 0.5));

    return result.data;
  }

  void solveTasks(List<MazeData> mazes) {
    final List<SolvedMazeModel> solvedMazes = [];
    for (var maze in mazes) {
      final solved = AStarAlgorithm.solveMaze(maze);
      solvedMazes.add(solved);

      emit(
        TaskLoadingState(
          progress: ((solvedMazes.length / mazes.length) / 2) + 0.5,
        ),
      );
    }
  }
}
