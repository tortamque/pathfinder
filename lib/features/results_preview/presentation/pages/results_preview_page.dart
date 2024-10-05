import 'package:flutter/material.dart';
import 'package:pathfinder/config/routes/app_routes.dart';
import 'package:pathfinder/config/themes/extensions.dart';
import 'package:pathfinder/core/shared/domain/entities/solved_maze_model.dart';

class ResultsPreviewPage extends StatelessWidget {
  const ResultsPreviewPage({super.key, required this.solvedMazes});

  final List<SolvedMazeModel> solvedMazes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result list screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: solvedMazes.length,
          itemBuilder: (context, index) {
            final solvedMaze = solvedMazes[index];

            return ListTile(
              onTap: () => ViewResultRoute($extra: solvedMaze).push(context),
              title: Center(
                child: Text(
                  solvedMaze.pathAsString,
                  style: context.textStyles.regular,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}
