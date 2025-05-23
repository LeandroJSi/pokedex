
import 'dart:typed_data';

abstract class HttpClient {
  Future<HttpResponse> get(String url, {Map<String, String>? headers});

  Future<HttpResponse> post(String url,
      {Map<String, String>? headers, Map<String, dynamic>? data});

  Future<HttpResponse> put(String url,
      {Map<String, String>? headers, Map<String, dynamic>? data});

  Future<HttpResponse> delete(String url, {Map<String, String>? headers});
}

class HttpResponse {
  final int statusCode;
  final String body;
  final Map<String, String> headers;
  final Uint8List bodyBytes;

  HttpResponse(this.statusCode, this.body, this.bodyBytes, this.headers);
}
