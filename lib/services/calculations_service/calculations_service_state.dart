part of 'calculations_service_cubit.dart';

sealed class CalculationsServiceState {}

final class InitialState extends CalculationsServiceState {}

final class TaskLoadingState extends CalculationsServiceState {}

final class TaskSolvingState extends CalculationsServiceState {}

final class TaskSolvedState extends CalculationsServiceState {}

final class TaskVerificationState extends CalculationsServiceState {}

final class TaskVerifiedState extends CalculationsServiceState {}
