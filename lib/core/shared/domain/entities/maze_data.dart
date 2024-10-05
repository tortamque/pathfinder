import 'package:pathfinder/core/shared/domain/entities/position.dart';

class MazeData {
  final String id;
  final List<String> field;
  final Position start;
  final Position end;

  MazeData({
    required this.id,
    required this.field,
    required this.start,
    required this.end,
  });

  factory MazeData.fromJson(Map<String, dynamic> json) {
    var fieldList = List<String>.from(json['field']);

    return MazeData(
      id: json['id'],
      field: fieldList,
      start: Position.fromJson(json['start']),
      end: Position.fromJson(json['end']),
    );
  }
}
