import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pathfinder/config/config_model/config_model.dart';
import 'package:pathfinder/core/network/app_response.dart';
import 'package:pathfinder/core/shared/domain/entities/maze_response.dart';
import 'package:pathfinder/core/shared/domain/entities/send_task.dart';

class SwaggerRepository {
  SwaggerRepository({
    required Dio client,
    required this.config,
  }) : _client = client;

  final Dio _client;
  final ConfigModel config;

  Future<AppResponse<MazeResponse>> getTask() async {
    try {
      final response = await _client.get(config.path!);

      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;

        final data = await compute(MazeResponse.fromJson, responseData);

        return AppResponse.success(data: data);
      }
    } catch (error) {
      return AppResponse.error(error: error);
    }

    return const AppResponse.error(error: 'Unknown error');
  }

  Future<AppResponse<SendTaskResponse>> sendTask(List<Map<String, dynamic>> solvedMazeJsons) async {
    try {
      final response = await _client.post(
        config.path!,
        data: solvedMazeJsons,
      );

      if (response.statusCode == 200) {
        final responseData = response.data as Map<String, dynamic>;

        final data = await compute(SendTaskResponse.fromJson, responseData);

        return AppResponse.success(data: data);
      }
    } catch (error) {
      return AppResponse.error(error: error);
    }

    return const AppResponse.error(error: 'Unknown error');
  }
}
