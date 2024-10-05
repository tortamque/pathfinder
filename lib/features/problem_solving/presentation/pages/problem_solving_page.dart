import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathfinder/services/calculations_service/calculations_service_cubit.dart';

class ProblemSolvingPage extends StatefulWidget {
  const ProblemSolvingPage({super.key});

  @override
  State<ProblemSolvingPage> createState() => _ProblemSolvingPageState();
}

class _ProblemSolvingPageState extends State<ProblemSolvingPage> {
  @override
  void initState() {
    super.initState();

    context.read<CalculationsServiceCubit>().getTask();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
