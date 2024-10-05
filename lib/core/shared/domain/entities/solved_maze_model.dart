import 'package:pathfinder/core/shared/domain/entities/maze_cell.dart';
import 'package:pathfinder/core/shared/domain/entities/position.dart';

class SolvedMazeModel {
  final String id;
  final List<List<MazeCell>> maze;
  final Position start;
  final Position end;
  final List<Position> path;
  final String pathAsString;

  SolvedMazeModel({
    required this.id,
    required this.maze,
    required this.start,
    required this.end,
    required this.path,
    required this.pathAsString,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "result": {
        "steps": path
            .map((pos) => {
                  "x": pos.x.toString(),
                  "y": pos.y.toString(),
                })
            .toList(),
        "path": pathAsString,
      }
    };
  }

  @override
  String toString() {
    return 'SolvedMazeModel(id: $id, maze: $maze, start: $start, end: $end, path: $path, pathAsString: $pathAsString)';
  }
}
