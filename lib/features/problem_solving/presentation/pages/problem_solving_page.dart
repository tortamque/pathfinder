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
        // TODO: implement listener
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
                //TODO Placeholder
                Text(
                  'Here will be calculations text',
                  style: context.textStyles.regular,
                ),
                //TODO Placeholder
                Text(
                  '${state is TaskLoadingState ? (state.progress * 100).floor() : 0}%',
                  style: context.textStyles.regular,
                ),
                //TODO Placeholder
                CircularProgressIndicator(
                  value: state is TaskLoadingState ? state.progress : 0,
                  strokeCap: StrokeCap.round,
                ),
                const Spacer(),
                MainButton(
                  onPressed: (state is TaskLoadingState ? state.progress : 0) == 100 ? () {} : null,
                  child: Text("Send results to server"),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
