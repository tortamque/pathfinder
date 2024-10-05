import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathfinder/config/themes/extensions.dart';
import 'package:pathfinder/services/calculations_service/calculations_service_cubit.dart';
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

    context.read<CalculationsServiceCubit>().solveTask();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculationsServiceCubit, CalculationsServiceState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!),
            ),
          );
        }
        if (state.isUploaded == true) {
          print('can redirrect');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Process screen'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const Spacer(),
                Text(
                  state.solvedMazes == null
                      ? 'Getting tasks and solving them... 🛠️'
                      : state.solvedMazes != null && state.isUploaded == null
                          ? 'Problem solved and ready to be checked 🚀'
                          : 'Tasks solved and checked ✅',
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
                  onPressed: state.progress == 1 && state.error == null
                      ? () => context.read<CalculationsServiceCubit>().sendTasks(state.solvedMazes ?? [])
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
}
