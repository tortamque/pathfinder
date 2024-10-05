part of 'calculations_service_cubit.dart';

sealed class CalculationsServiceState {}

final class InitialState extends CalculationsServiceState {}

final class TaskLoadingState extends CalculationsServiceState {
  final double progress;

  TaskLoadingState({required this.progress});
}

final class TaskErrorState extends CalculationsServiceState {}
