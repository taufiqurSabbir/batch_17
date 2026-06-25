class ApiResponse {
  final int responseCode;
  final dynamic responseData;
  final bool isSuccess;
  final String? errorMessage;

  ApiResponse({
    required this.responseCode,
    required this.responseData,
    required this.isSuccess,
    this.errorMessage,
  });
}
