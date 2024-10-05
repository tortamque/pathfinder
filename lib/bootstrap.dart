import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pathfinder/app/app_provider.dart';
import 'package:pathfinder/config/config_model/config_model.dart';
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
    child: AppProdiver(
      child: child,
    ),
  );
}
