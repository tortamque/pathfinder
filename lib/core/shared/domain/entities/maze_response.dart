import 'package:pathfinder/core/shared/domain/entities/maze_data.dart';

class MazeResponse {
  final bool error;
  final String message;
  final List<MazeData> data;

  MazeResponse({
    required this.error,
    required this.message,
    required this.data,
  });

  factory MazeResponse.fromJson(Map<String, dynamic> json) {
    var mazeList = json['data'] as List;
    List<MazeData> mazeDataList = mazeList.map((i) => MazeData.fromJson(i)).toList();

    return MazeResponse(
      error: json['error'],
      message: json['message'],
      data: mazeDataList,
    );
  }
}
