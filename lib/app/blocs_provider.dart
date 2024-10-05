import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathfinder/config/data_sources/remote/swagger_repository.dart';
import 'package:pathfinder/features/enter_url/presentation/bloc/url_verifier/url_verifier_cubit.dart';
import 'package:pathfinder/features/problem_solving/presentation/bloc/calculations_cubit/calculations_cubit.dart';

class BlocsProvider extends StatelessWidget {
  const BlocsProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CalculationsCubit>(
          create: (context) => CalculationsCubit(
            context.read<SwaggerRepository>(),
          ),
        ),
        BlocProvider<UrlVerifierCubit>(
          create: (context) => UrlVerifierCubit(),
        ),
      ],
      child: child,
    );
  }
}
