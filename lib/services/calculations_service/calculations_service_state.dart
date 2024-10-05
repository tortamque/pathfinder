part of 'calculations_service_cubit.dart';

sealed class CalculationsServiceState {}

final class InitialState extends CalculationsServiceState {}

final class TaskLoadingState extends CalculationsServiceState {
  final double progress;

  TaskLoadingState({required this.progress});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskLoadingState && runtimeType == other.runtimeType && progress == other.progress;

  @override
  int get hashCode => progress.hashCode;
}

final class TaskErrorState extends CalculationsServiceState {}
