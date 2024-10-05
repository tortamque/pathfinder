import 'package:pathfinder/config/config_model/base_config_model.dart';

class ConfigModel extends BaseConfigModel {
  ConfigModel({required super.baseUrl});

  ConfigModel copyWith({String? baseUrl}) {
    return ConfigModel(
      baseUrl: baseUrl ?? this.baseUrl,
    );
  }

  @override
  String toString() {
    return 'ConfigModel(baseUrl: $baseUrl)';
  }

  @override
  int get hashCode => baseUrl.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ConfigModel && other.baseUrl == baseUrl;
  }
}
