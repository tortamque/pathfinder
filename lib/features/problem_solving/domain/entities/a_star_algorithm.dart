import 'package:pathfinder/core/shared/domain/entities/maze_data.dart';
import 'package:pathfinder/core/shared/domain/entities/position.dart';
import 'package:pathfinder/features/problem_solving/domain/entities/a_star_node.dart';
import 'package:collection/collection.dart';

class AStarAlgorithm {
  static Map<String, dynamic> solveMaze(MazeData mazeData) {
    List<String> field = mazeData.field;
    Position start = mazeData.start;
    Position end = mazeData.end;

    int rows = field.length;
    int cols = field[0].length;

    List<List<int>> directions = [
      [0, 1],
      [1, 0],
      [0, -1],
      [-1, 0],
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ];

    final priorityQueue = PriorityQueue<AStarNode>((a, b) => a.f.compareTo(b.f));
    Map<Position, Position?> cameFrom = {};
    Map<Position, int> gScore = {};

    priorityQueue.add(AStarNode(start, 0, start.manhattanDistance(end)));
    gScore[start] = 0;
    cameFrom[start] = null;

    while (priorityQueue.isNotEmpty) {
      AStarNode current = priorityQueue.removeFirst();

      if (current.position == end) {
        return {
          'id': mazeData.id,
          'path': _reconstructPath(cameFrom, current.position),
        };
      }

      for (var direction in directions) {
        int newX = current.position.x + direction[0];
        int newY = current.position.y + direction[1];
        Position neighbor = Position(x: newX, y: newY);

        if (newX >= 0 && newX < rows && newY >= 0 && newY < cols && field[newX][newY] == '.') {
          int tentativeGScore = gScore[current.position]! + 1;

          if (tentativeGScore < (gScore[neighbor] ?? double.infinity)) {
            cameFrom[neighbor] = current.position;
            gScore[neighbor] = tentativeGScore;
            int fScore = tentativeGScore + neighbor.manhattanDistance(end);
            priorityQueue.add(AStarNode(neighbor, tentativeGScore, fScore));
          }
        }
      }
    }

    return {
      'id': mazeData.id,
      'path': 'No path found',
    };
  }

  static List<Map<String, int>> _reconstructPath(
    Map<Position, Position?> cameFrom,
    Position current,
  ) {
    List<Map<String, int>> totalPath = [];

    Position? currentPos = current;

    while (currentPos != null) {
      totalPath.add({'x': currentPos.x, 'y': currentPos.y});

      currentPos = cameFrom[currentPos];
    }

    return totalPath.reversed.toList();
  }
}
