import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathfinder/config/routes/app_routes.dart';
import 'package:pathfinder/config/themes/extensions.dart';
import 'package:pathfinder/features/problem_solving/presentation/bloc/calculations_cubit/calculations_cubit.dart';
import 'package:pathfinder/widgets/buttons/main_button.dart';

class ProblemSolvingPage extends StatefulWidget {
  const ProblemSolvingPage({super.key});

  @override
  State<ProblemSolvingPage> createState() => _ProblemSolvingPageState();
}

class _ProblemSolvingPageState extends State<ProblemSolvingPage> {
  @override
  void initState() {
    super.initState();

    context.read<CalculationsCubit>().solveTask();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculationsCubit, CalculationsState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!),
            ),
          );
        }
        if (state.isUploaded == true) {
          ResultsPreviewRoute($extra: state.solvedMazes ?? []).pushReplacement(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Process screen'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Spacer(),
                Text(
                  _getStatusText(state),
                  style: context.textStyles.regular,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    '${(state.progress * 100).floor()}%',
                    style: context.textStyles.regular,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: SizedBox.square(
                    dimension: 72,
                    child: CircularProgressIndicator(
                      value: state.progress,
                      strokeCap: StrokeCap.round,
                    ),
                  ),
                ),
                const Spacer(),
                MainButton(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  onPressed: state.progress == 1 && state.error == null
                      ? () => context.read<CalculationsCubit>().sendTasks(state.solvedMazes ?? [])
                      : null,
                  child: Text(
                    state.isUploaded == null ? "Send results to server" : "Results checked",
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  String _getStatusText(CalculationsState state) {
    if (state.solvedMazes == null) {
      return 'Getting tasks and solving them... 🛠️';
    }
    if (state.isUploading == true) {
      return 'Uploading and checking the problem solution 🚀';
    }
    if (state.solvedMazes != null && state.isUploaded == null) {
      return 'Problem solved and ready to be checked 🚀';
    }
    return 'Tasks solved and checked ✅';
  }
}
