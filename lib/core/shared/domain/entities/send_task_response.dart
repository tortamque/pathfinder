class SendTaskResponse {
  final bool error;
  final String message;
  final List<SendTaskData> data;

  SendTaskResponse({
    required this.error,
    required this.message,
    required this.data,
  });

  factory SendTaskResponse.fromJson(Map<String, dynamic> json) {
    return SendTaskResponse(
      error: json['error'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List).map((item) => SendTaskData.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'SendTaskResponse{error: $error, message: $message, data: $data}';
  }
}

class SendTaskData {
  final String id;
  final bool correct;

  SendTaskData({
    required this.id,
    required this.correct,
  });

  factory SendTaskData.fromJson(Map<String, dynamic> json) {
    return SendTaskData(
      id: json['id'] as String,
      correct: json['correct'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'correct': correct,
    };
  }

  @override
  String toString() {
    return 'SendTaskData{id: $id, correct: $correct}';
  }
}
