part of 'calculations_cubit.dart';

class CalculationsState {
  final double progress;
  final String? error;
  final List<SolvedMazeModel>? solvedMazes;
  final bool? isUploaded;

  CalculationsState({
    this.progress = 0,
    this.error,
    this.solvedMazes,
    this.isUploaded,
  });

  CalculationsState copyWith({
    double? progress,
    String? error,
    List<SolvedMazeModel>? solvedMazes,
    bool? isUploaded,
  }) {
    return CalculationsState(
      progress: progress ?? this.progress,
      error: error ?? this.error,
      solvedMazes: solvedMazes ?? this.solvedMazes,
      isUploaded: isUploaded ?? this.isUploaded,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalculationsState &&
          runtimeType == other.runtimeType &&
          progress == other.progress &&
          error == other.error &&
          solvedMazes == other.solvedMazes &&
          isUploaded == other.isUploaded;

  @override
  int get hashCode => progress.hashCode ^ error.hashCode;

  @override
  String toString() {
    return 'CalculationsState(progress: $progress, error: $error, solvedMazes: $solvedMazes, isUploaded: $isUploaded)';
  }
}
