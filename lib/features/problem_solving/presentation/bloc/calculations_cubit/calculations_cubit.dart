import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathfinder/config/data_sources/remote/swagger_repository.dart';
import 'package:pathfinder/core/network/app_response.dart';
import 'package:pathfinder/core/shared/domain/entities/maze_data.dart';
import 'package:pathfinder/core/shared/domain/entities/maze_response.dart';
import 'package:pathfinder/core/shared/domain/entities/solved_maze_model.dart';
import 'package:pathfinder/features/problem_solving/domain/entities/a_star_algorithm.dart';

part 'calculations_state.dart';

class CalculationsCubit extends Cubit<CalculationsState> {
  CalculationsCubit(this.swaggerRepository) : super(CalculationsState());

  final SwaggerRepository swaggerRepository;
  Completer<void>? _completer;

  Future<void> solveTask() async {
    emit(CalculationsState());
    _completer = Completer<void>();
    _updateLoadingProgressWhileLoading();

    final result = await getTasks();

    if (result == null) {
      _completer?.complete();
      emit(state.copyWith(error: 'Error while loading tasks'));
      return;
    }

    _completer?.complete();
    solveTasks(result.data);
  }

  Future<void> _updateLoadingProgressWhileLoading() async {
    double progress = 0;
    while (!_completer!.isCompleted) {
      progress += 1;
      if (progress <= 49) {
        emit(state.copyWith(progress: progress / 100));
      }
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }

  Future<MazeResponse?> getTasks() async {
    final result = await swaggerRepository.getTask();
    if (result is ErrorResponse) {
      return null;
    }
    emit(state.copyWith(progress: 0.5));
    return result.data;
  }

  void solveTasks(List<MazeData> mazes) {
    final List<SolvedMazeModel> solvedMazes = [];
    for (var maze in mazes) {
      final solved = AStarAlgorithm.solveMaze(maze);
      solvedMazes.add(solved);

      emit(state.copyWith(
        progress: ((solvedMazes.length / mazes.length) / 2) + 0.5,
        solvedMazes: ((solvedMazes.length / mazes.length) / 2) + 0.5 == 1 ? solvedMazes : null,
      ));
    }
  }

  Future<void> sendTasks(List<SolvedMazeModel> solvedMazes) async {
    emit(state.copyWith(progress: 0, isUploading: true));

    _completer = Completer<void>();
    _updateSendingProgressWhileUploading();

    final List<Map<String, dynamic>> solvedMazeJsons = solvedMazes.map((solvedMaze) => solvedMaze.toJson()).toList();

    final result = await swaggerRepository.sendTask(solvedMazeJsons);

    _completer?.complete();

    if (result is ErrorResponse) {
      emit(state.copyWith(error: result.error.toString()));
      return;
    }

    emit(state.copyWith(
      isUploaded: true,
      progress: 1,
      isUploading: false,
    ));
  }

  Future<void> _updateSendingProgressWhileUploading() async {
    double progress = 0;
    while (!_completer!.isCompleted) {
      progress += 1;
      if (progress <= 99) {
        emit(state.copyWith(progress: progress / 100));
      }
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }
}
