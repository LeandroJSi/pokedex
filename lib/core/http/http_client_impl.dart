import 'dart:convert';
import 'package:http_interceptor/http/intercepted_http.dart';

import 'http_client.dart';
import 'package:http/http.dart' as http;

class HttpClientImpl implements HttpClient {
  final InterceptedHttp interceptedHttp;
  final String apiUrl;

  const HttpClientImpl({
    required this.interceptedHttp,
    required this.apiUrl,
  });

  @override
  Future<HttpResponse> get(String url, {Map<String, String>? headers}) async {
    headers = {...?headers, 'Content-Type': 'application/json; charset=utf-8'};
    final response =
        await interceptedHttp.get(Uri.parse(apiUrl + url), headers: headers);
    return _processResponse(response);
  }

  @override
  Future<HttpResponse> post(String url,
      {Map<String, String>? headers, Map<String, dynamic>? data}) async {
    headers = {...?headers, 'Content-Type': 'application/json'};
    final response = await interceptedHttp.post(Uri.parse(apiUrl + url),
        headers: headers, body: json.encode(data));
    return _processResponse(response);
  }

  @override
  Future<HttpResponse> put(String url,
      {Map<String, String>? headers, Map<String, dynamic>? data}) async {
    headers = {...?headers, 'Content-Type': 'application/json'};
    final response = await interceptedHttp.put(Uri.parse(apiUrl + url),
        headers: headers, body: json.encode(data));
    return _processResponse(response);
  }

  @override
  Future<HttpResponse> delete(String url,
      {Map<String, String>? headers}) async {
    headers = {...?headers, 'Content-Type': 'application/json'};
    final response =
        await interceptedHttp.delete(Uri.parse(apiUrl + url), headers: headers);
    return _processResponse(response);
  }

  HttpResponse _processResponse(http.Response response) {
    final statusCode = response.statusCode;
    final body = response.body;
    final bodyBytes = response.bodyBytes;
    final headers = response.headers;
    return HttpResponse(statusCode, body, bodyBytes, headers);
  }
}
