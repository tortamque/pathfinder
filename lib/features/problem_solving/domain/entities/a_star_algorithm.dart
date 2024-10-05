import 'package:pathfinder/core/shared/domain/entities/maze_cell.dart';
import 'package:pathfinder/core/shared/domain/entities/maze_data.dart';
import 'package:pathfinder/core/shared/domain/entities/position.dart';
import 'package:pathfinder/core/shared/domain/entities/solved_maze_model.dart';
import 'package:pathfinder/features/problem_solving/domain/entities/a_star_node.dart';
import 'package:collection/collection.dart';

class AStarAlgorithm {
  static SolvedMazeModel solveMaze(MazeData mazeData) {
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

    List<Position> pathPositions = [];

    while (priorityQueue.isNotEmpty) {
      AStarNode current = priorityQueue.removeFirst();

      if (current.position == end) {
        pathPositions = _reconstructPath(cameFrom, current.position);
        String pathAsString = pathPositions.map((pos) => '(${pos.x},${pos.y})').join('->');

        return SolvedMazeModel(
          id: mazeData.id,
          maze: _convertFieldToMaze(mazeData, pathPositions),
          start: start,
          end: end,
          path: pathPositions,
          pathAsString: pathAsString,
        );
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

    return SolvedMazeModel(
      id: mazeData.id,
      maze: _convertFieldToMaze(mazeData, []),
      start: start,
      end: end,
      path: [],
      pathAsString: 'No path found',
    );
  }

  static List<Position> _reconstructPath(
    Map<Position, Position?> cameFrom,
    Position current,
  ) {
    List<Position> totalPath = [];
    Position? currentPos = current;

    while (currentPos != null) {
      totalPath.add(currentPos);
      currentPos = cameFrom[currentPos];
    }

    return totalPath.reversed.toList();
  }

  static List<List<MazeCell>> _convertFieldToMaze(MazeData mazeData, List<Position> pathPositions) {
    List<List<MazeCell>> maze = List.generate(
      mazeData.field.length,
      (i) => List.generate(mazeData.field[i].length, (j) {
        if (mazeData.field[i][j] == 'X') return MazeCell.blocked;
        return MazeCell.empty;
      }),
    );

    maze[mazeData.start.y][mazeData.start.x] = MazeCell.start;
    maze[mazeData.end.y][mazeData.end.x] = MazeCell.end;

    for (var pos in pathPositions) {
      if (pos != mazeData.start && pos != mazeData.end) {
        maze[pos.y][pos.x] = MazeCell.path;
      }
    }

    return maze;
  }
}
