import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_delivery/constants/apis.dart';
import 'package:food_delivery/main.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  final String _baseUrl = Apis.baseUrl;

  /// GET Request
  Future<dynamic> getRequest(
    String endpoint, {
    Map<String, String>? queryParams,
    Map<String, String>? headers, // ✅ Optional headers added
  }) async {
    final Uri url = Uri.parse(
      "$_baseUrl$endpoint",
    ).replace(queryParameters: queryParams);
    log('GET URL: $url');

    try {
      final defaultHeaders = {'Content-Type': 'application/json'};
      final mergedHeaders = {
        ...defaultHeaders,
        if (headers != null) ...headers,
      };

      final response = await http.get(
        url,
        headers: mergedHeaders,
      ); // ✅ Pass headers here

      log('Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.body.isNotEmpty) {
          try {
            final decoded = jsonDecode(response.body);
            if (decoded is List || decoded is Map<String, dynamic>) {
              return decoded;
            } else {
              showError('Unexpected JSON structure.');
            }
          } catch (e) {
            showError('Invalid JSON format.\nError: $e');
          }
        } else {
          showError('Empty response body.');
        }
      } else {
        showError('Error ${response.statusCode}: ${response.reasonPhrase}');
      }
    } on SocketException {
      navigatorKey.currentContext?.go('/networkerror');
    } catch (e, stackTrace) {
      showError('Something went wrong, please try again.');
      log('Unexpected Error: $e');
      log('Stack Trace: $stackTrace');
    }

    return null;
  }

  /// POST / PUT / DELETE Request with JSON Body
  Future<Map<String, dynamic>?> apiRequestWithJsonBody({
    required String endpoint,
    required Map<String, dynamic> body,
    required String method,
    Map<String, String>? queryParams,
    Map<String, String>? headers, // optional headers
  }) async {
    final Uri url = Uri.parse(
      "$_baseUrl$endpoint",
    ).replace(queryParameters: queryParams);

    try {
      http.Response response;

      // Use default header if none is provided
      final defaultHeaders = {'Content-Type': 'application/json'};
      final mergedHeaders = {
        ...defaultHeaders,
        if (headers != null) ...headers,
      };

      // Choose HTTP method
      switch (method.toUpperCase()) {
        case 'POST':
          response = await http.post(
            url,
            headers: mergedHeaders,
            body: jsonEncode(body),
          );
          break;
        case 'PUT':
          response = await http.put(
            url,
            headers: mergedHeaders,
            body: jsonEncode(body),
          );
          break;
        case 'DELETE':
          response = await http.delete(
            url,
            headers: mergedHeaders,
            body: jsonEncode(body),
          );
          break;
        default:
          throw Exception("Unsupported HTTP method: $method");
      }

      log('$method URL: $url');
      log('Body: $body');
      log('Status: ${response.statusCode}');
      log('Response: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      }

      final Map<String, dynamic> errorResponse = jsonDecode(response.body);
      final String errorMessage =
          errorResponse['message'] ?? 'Unknown server error';
      showError("Error ${response.statusCode}: $errorMessage");
    } on SocketException {
      showError("No Internet connection.");
    } on FormatException {
      showError("Invalid response format from server.");
    } on HttpException catch (httpError) {
      showError("HTTP error: ${httpError.message}");
    } catch (e, stackTrace) {
      showError("Unexpected error: ${e.toString()}");
      log('Unexpected Error: $e');
      log('Stack Trace: $stackTrace');
    }

    return null;
  }

  Future<Map<String, dynamic>?> apiRequestWithFormUrlEncodedBody({
    required String endpoint,
    required Map<String, dynamic> body,
    required String method,
    Map<String, String>? queryParams,
    Map<String, String>? headers, // optional headers
  }) async {
    final Uri url = Uri.parse(
      "$_baseUrl$endpoint",
    ).replace(queryParameters: queryParams);

    try {
      http.Response response;

      // Default content type for form data
      final defaultHeaders = {
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      final mergedHeaders = {
        ...defaultHeaders,
        if (headers != null) ...headers,
      };

      // Encode body to x-www-form-urlencoded string
      final encodedBody = body.entries
          .map(
            (e) =>
                '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent(e.value.toString())}',
          )
          .join('&');

      // Choose HTTP method
      switch (method.toUpperCase()) {
        case 'POST':
          response = await http.post(
            url,
            headers: mergedHeaders,
            body: encodedBody,
          );
          break;
        case 'PUT':
          response = await http.put(
            url,
            headers: mergedHeaders,
            body: encodedBody,
          );
          break;
        case 'DELETE':
          response = await http.delete(
            url,
            headers: mergedHeaders,
            body: encodedBody,
          );
          break;
        default:
          throw Exception("Unsupported HTTP method: $method");
      }

      log('$method URL: $url');
      log('Encoded Body: $encodedBody');
      log('Status: ${response.statusCode}');
      log('Response: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      }

      final Map<String, dynamic> errorResponse = jsonDecode(response.body);
      final String errorMessage =
          errorResponse['message'] ?? 'Unknown server error';
      showError("Error ${response.statusCode}: $errorMessage");
    } on SocketException {
      showError("No Internet connection.");
    } on FormatException {
      showError("Invalid response format from server.");
    } on HttpException catch (httpError) {
      showError("HTTP error: ${httpError.message}");
    } catch (e, stackTrace) {
      showError("Unexpected error: ${e.toString()}");
      log('Unexpected Error: $e');
      log('Stack Trace: $stackTrace');
    }

    return null;
  }

  /// Centralized error display method
  void showError(String message) {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
