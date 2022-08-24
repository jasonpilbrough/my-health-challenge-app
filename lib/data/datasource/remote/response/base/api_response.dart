class ApiResponse {
  final String? apiResponseCode;
  final String? apiMessage;
  final dynamic data;

  ApiResponse(this.apiResponseCode, this.apiMessage, this.data);

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        null,
        null,
        json['matches'],
      );
}
