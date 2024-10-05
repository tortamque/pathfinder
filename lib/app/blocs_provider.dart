import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathfinder/config/data_sources/remote/swagger_repository.dart';
import 'package:pathfinder/features/enter_url/presentation/bloc/url_verifier/url_verifier_cubit.dart';
import 'package:pathfinder/services/calculations_service/calculations_service_cubit.dart';

class BlocsProvider extends StatelessWidget {
  const BlocsProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CalculationsServiceCubit>(
          create: (context) => CalculationsServiceCubit(
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
