import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathfinder/config/data_sources/remote/swagger_repository.dart';

class AppProdiver extends StatelessWidget {
  const AppProdiver({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SwaggerRepository>(
          create: (context) => SwaggerRepository(
            client: context.read<Dio>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
