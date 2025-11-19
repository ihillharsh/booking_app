class ApiResponse<T> {
  final int statusCode;
  final bool success;
  final String message;
  final T data;

  ApiResponse({
    required this.statusCode,
    required this.success,
    required this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return ApiResponse<T>(
      statusCode: json['statusCode'] as int? ?? 200,
      success: json['success'] as bool? ?? true,
      message: json['message'] as String? ?? '',
      data: fromJsonT(json['data']),
    );
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    return {
      'statusCode': statusCode,
      'success': success,
      'message': message,
      'data': toJsonT(data),
    };
  }
}
