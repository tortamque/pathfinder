part of 'calculations_cubit.dart';

class CalculationsState {
  final double progress;
  final String? error;
  final List<SolvedMazeModel>? solvedMazes;
  final bool? isUploading;
  final bool? isUploaded;

  CalculationsState({
    this.progress = 0,
    this.error,
    this.solvedMazes,
    this.isUploaded,
    this.isUploading,
  });

  CalculationsState copyWith({
    double? progress,
    String? error,
    List<SolvedMazeModel>? solvedMazes,
    bool? isUploaded,
    bool? isUploading,
  }) {
    return CalculationsState(
      progress: progress ?? this.progress,
      error: error ?? this.error,
      solvedMazes: solvedMazes ?? this.solvedMazes,
      isUploaded: isUploaded ?? this.isUploaded,
      isUploading: isUploading ?? this.isUploading,
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
          isUploaded == other.isUploaded &&
          isUploading == other.isUploading;

  @override
  int get hashCode =>
      progress.hashCode ^ error.hashCode ^ solvedMazes.hashCode ^ isUploaded.hashCode ^ isUploading.hashCode;

  @override
  String toString() {
    return 'CalculationsState(progress: $progress, error: $error, solvedMazes: $solvedMazes, isUploaded: $isUploaded)';
  }
}
