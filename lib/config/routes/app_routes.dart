import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pathfinder/config/config_model/config_model.dart';
import 'package:pathfinder/config/data_sources/remote/swagger_repository.dart';
import 'package:pathfinder/core/shared/domain/entities/solved_maze_model.dart';
import 'package:pathfinder/features/enter_url/presentation/bloc/url_verifier/url_verifier_cubit.dart';
import 'package:pathfinder/features/enter_url/presentation/pages/enter_url_page.dart';
import 'package:pathfinder/features/problem_solving/presentation/bloc/calculations_cubit/calculations_cubit.dart';
import 'package:pathfinder/features/problem_solving/presentation/pages/problem_solving_page.dart';
import 'package:pathfinder/features/results_preview/presentation/pages/results_preview_page.dart';
import 'package:pathfinder/features/view_result/presentation/pages/view_result_page.dart';

part 'app_routes.g.dart';

@TypedGoRoute<HomeRoute>(path: '/')
final class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return BlocProvider(
      create: (context) => UrlVerifierCubit(),
      child: const HomePage(),
    );
  }
}

@TypedGoRoute<ProblemSolvingRoute>(path: '/problem-solving')
final class ProblemSolvingRoute extends GoRouteData {
  const ProblemSolvingRoute({required this.$extra});

  final Uri $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final newConfig = ConfigModel(
      baseUrl: $extra.origin,
      path: $extra.path,
    );

    return BlocProvider(
      create: (context) => CalculationsCubit(
        SwaggerRepository(
          client: Dio(
            BaseOptions(
              baseUrl: newConfig.baseUrl!,
            ),
          ),
          config: newConfig,
        ),
      ),
      child: const ProblemSolvingPage(),
    );
  }
}

@TypedGoRoute<ResultsPreviewRoute>(path: '/results-preview')
final class ResultsPreviewRoute extends GoRouteData {
  const ResultsPreviewRoute({required this.$extra});

  final List<SolvedMazeModel> $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ResultsPreviewPage(
      solvedMazes: $extra,
    );
  }
}

@TypedGoRoute<ViewResultRoute>(path: '/view-result')
final class ViewResultRoute extends GoRouteData {
  const ViewResultRoute({required this.$extra});

  final SolvedMazeModel $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ViewResultPage(
      solvedMaze: $extra,
    );
  }
}
