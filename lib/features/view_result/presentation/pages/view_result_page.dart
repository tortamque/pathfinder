import 'package:flutter/material.dart';
import 'package:pathfinder/config/themes/extensions.dart';
import 'package:pathfinder/core/shared/domain/entities/solved_maze_model.dart';

class ViewResultPage extends StatelessWidget {
  const ViewResultPage({super.key, required this.solvedMaze});

  final SolvedMazeModel solvedMaze;

  int get columnsAmount => solvedMaze.maze.length;
  int get rowsAmount => solvedMaze.maze.first.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: columnsAmount * rowsAmount,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: rowsAmount,
              ),
              itemBuilder: (context, index) {
                final row = index ~/ rowsAmount;
                final column = index % rowsAmount;
                final cell = solvedMaze.maze[row][column];

                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.5),
                    color: cell.color,
                  ),
                  child: Center(
                    child: Text(
                      '($row,$column)',
                      style: context.textStyles.regular,
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22),
              child: Text(
                solvedMaze.pathAsString,
                style: context.textStyles.regular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
