import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pathfinder/app/app_provider.dart';
import 'package:pathfinder/config/config_model/config_model.dart';
import 'package:pathfinder/config/data_sources/remote/swagger_repository.dart';
import 'package:pathfinder/features/enter_url/presentation/bloc/url_verifier/url_verifier_cubit.dart';
import 'package:pathfinder/services/calculations_service/calculations_service_cubit.dart';
import 'package:provider/provider.dart';

Widget bootstrap({
  required ConfigModel configModel,
  required Widget child,
}) {
  return MultiProvider(
    providers: [
      Provider<ConfigModel>(create: (_) => configModel),
      Provider<Dio>(
        create: (_) => Dio(
          BaseOptions(
            baseUrl: configModel.baseUrl,
          ),
        ),
      )
    ],
    child: MultiBlocProvider(
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
      child: AppProdiver(
        child: child,
      ),
    ),
  );
}
