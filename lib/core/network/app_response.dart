sealed class AppResponse<T> {
  const AppResponse._({
    this.data,
    this.error,
    this.success = true,
    this.code = -1,
  });

  const factory AppResponse.success({
    required T data,
  }) = SuccessResponse<T>;

  const factory AppResponse.error({
    dynamic error,
    int code,
  }) = ErrorResponse<T>;

  factory AppResponse({
    T? data,
    dynamic error,
    bool success = true,
    int code = -1,
  }) {
    if (success) {
      return AppResponse.success(data: data as T);
    } else {
      return AppResponse.error(error: error, code: code);
    }
  }

  final T? data;
  final dynamic error;
  final bool success;
  final int code;

  @override
  String toString() {
    return 'AppResponse(data: $data, error: $error, success: $success, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppResponse<T> &&
        other.data == data &&
        other.error == error &&
        other.success == success &&
        other.code == code;
  }

  @override
  int get hashCode {
    return data.hashCode ^ error.hashCode ^ success.hashCode ^ code.hashCode;
  }
}

class SuccessResponse<T> extends AppResponse<T> {
  const SuccessResponse({
    required T data,
  }) : super._(data: data);

  @override
  T get data => super.data as T;

  @override
  String toString() => 'SuccessResponse(data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SuccessResponse<T> && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class ErrorResponse<T> extends AppResponse<T> {
  const ErrorResponse({
    super.error,
    super.code,
  }) : super._(success: false);

  @override
  String toString() => 'ErrorResponse(error: $error)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ErrorResponse<T> && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}
