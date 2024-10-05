abstract class BaseConfigModel {
  const BaseConfigModel({
    required this.baseUrl,
    required this.path,
  });

  final String baseUrl;
  final String path;
}
