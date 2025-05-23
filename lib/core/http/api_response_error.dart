class ResponseError {
  final String title;
  final int status;
  final String detail;

  ResponseError({required this.title, required this.status, required this.detail});

  factory ResponseError.fromJson(Map<String, dynamic> json) {
    return ResponseError(
      title: json['title'],
      status: json['status'],
      detail: json['detail'],
    );
  }
}
