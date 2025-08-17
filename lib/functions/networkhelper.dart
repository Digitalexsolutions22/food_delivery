import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:food_delivery/constants/apis.dart';
import 'package:food_delivery/functions/uxhelper.dart';
import 'package:food_delivery/main.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class GetApiHelper {
  final String _baseUrl = Apis.baseUrl;

  Future<dynamic> getRequest(
    String endpoint, {
    Map<String, String>? queryParams,
  }) async {
    final Uri url = Uri.parse(
      '$_baseUrl$endpoint',
    ).replace(queryParameters: queryParams);

    log('Request URL: $url');

    try {
      final response = await http.get(url);

      log('Response Code: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.body.isNotEmpty) {
          try {
            final decodedResponse = jsonDecode(response.body);

            if (decodedResponse is List) {
              return decodedResponse;
            } else if (decodedResponse is Map<String, dynamic>) {
              return decodedResponse;
            } else {
              scaffoldMessengerKey.currentState?.showSnackBar(
                const SnackBar(content: Text('Unexpected JSON structure.')),
              );
              return null;
            }
          } catch (e) {
            scaffoldMessengerKey.currentState?.showSnackBar(
              SnackBar(content: Text('Invalid JSON format. Error: $e')),
            );
          }
        } else {
          scaffoldMessengerKey.currentState?.showSnackBar(
            const SnackBar(content: Text('Empty response body.')),
          );
        }
      } else {
        scaffoldMessengerKey.currentState?.showSnackBar(
          SnackBar(
            content: Text(
              'Error: ${response.statusCode} - ${response.reasonPhrase}',
            ),
          ),
        );
      }
      return null;
    } on SocketException {
      navigatorKey.currentContext!.go("/networkerror");
      return null;
    } catch (e, stackTrace) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        const SnackBar(
          content: Text('Something went wrong, please try again.'),
        ),
      );
      log('Unexpected Error: $e');
      log('Stack Trace: $stackTrace');
      return null;
    }
  }
}

class PostApiHelper {
  final String _baseUrl = Apis.baseUrl;

  /// Sends a POST request with quiz answers.
  Future<Map<String, dynamic>?> postapi({
    required String endpoint,
    required int userId,
    required int quizId,
    required List<int> questionIds,
    required List<int> selectedAnswers,
  }) async {
    final Uri url = Uri.parse('$_baseUrl$endpoint');

    // Constructing the answers list
    List<Map<String, dynamic>> answers = List.generate(
      questionIds.length,
      (index) => {
        "question_id": questionIds[index],
        "selected_option": selectedAnswers[index],
      },
    );

    try {
      var request = http.MultipartRequest("POST", url);

      // Add required fields
      request.fields["user_id"] = userId.toString();
      request.fields["quiz_id"] = quizId.toString();
      request.fields["answers"] = jsonEncode(answers); // Stringified JSON array

      log('Request (Form Data) URL: $url');
      log('Request (Form Data) Fields: ${request.fields}');

      final response = await request.send();
      final responseData = await http.Response.fromStream(response);

      return jsonDecode(responseData.body);
    } on SocketException {
      return handleNetworkError();
    } on HttpException catch (httpError) {
      return _showError("HTTP error: ${httpError.message}");
    } catch (e, stackTrace) {
      log('Unexpected Error: $e');
      log('Stack Trace: $stackTrace');

      _showError("Something went wrong, please try again.");
    }
    return null;
  }

  // Handles API responses
  Map<String, dynamic>? handleResponse(http.Response response) {
    log('Response Status Code: ${response.statusCode}');
    log('Response Body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseJson = jsonDecode(response.body);

      return responseJson;
    } else {
      _showMessage('Error: ${response.statusCode} - ${response.reasonPhrase}');
      return null;
    }
  }

  // Handle network error by navigating to network error screen
  Map<String, dynamic>? handleNetworkError() {
    navigatorKey.currentContext?.go("/networkerror");
    return null;
  }

  // Show success or error messages
  void _showMessage(String message) {
    final context = navigatorKey.currentContext;
    if (context != null) {
      TopMessageDialog.show(message: message);
    }
  }

  Map<String, dynamic>? _showError(String message) {
    _showMessage(message);
    return null;
  }

  Future<Map<String, dynamic>?> postApiWithJsonBody({
    required String endpoint,
    required Map<String, dynamic> body,
    bool? returnmsg = false,
  }) async {
    final Uri url = Uri.parse('${Apis.baseUrl}$endpoint');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          // Add auth token or other headers here if needed
        },
        body: jsonEncode(body),
      );

      log('POST Request URL: $url');
      log('POST Request Body: $body');
      log('Response Status: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final res = jsonDecode(response.body);
        if (returnmsg == false) {
          if (res["status"] == "success") {
            return jsonDecode(response.body);
          } else {
            _showError(res["message"]);
          }
        } else {
          return jsonDecode(response.body);
        }
      }
    } on SocketException {
      return _showError("No Internet");
    } on HttpException catch (httpError) {
      return _showError("HTTP error: ${httpError.message}");
    } catch (e, stackTrace) {
      log('Unexpected Error: $e');
      log('Stack Trace: $stackTrace');

      _showError("Something went wrong, please try again.");
    }
    return null;
  }

  Future<Map<String, dynamic>?> apiRequestWithJsonBody({
    required String endpoint,
    required Map<String, dynamic> body,
    required String method, // 'POST', 'PUT', or 'DELETE'
  }) async {
    final Uri url = Uri.parse('${Apis.baseUrl}$endpoint');

    try {
      http.Response response;

      // Choose HTTP method dynamically
      switch (method.toUpperCase()) {
        case 'POST':
          response = await http.post(
            url,
            headers: {
              'Content-Type': 'application/json',
              // Add auth token or headers if needed
            },
            body: jsonEncode(body),
          );
          break;
        case 'PUT':
          response = await http.put(
            url,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(body),
          );
          break;
        case 'DELETE':
          response = await http.delete(
            url,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(body),
          );
          break;
        default:
          throw Exception("Unsupported HTTP method: $method");
      }

      log('$method Request URL: $url');
      log('$method Request Body: $body');
      log('Response Status: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        _showError("Server error: ${response.statusCode}");
      }
    } on SocketException {
      return _showError("No Internet");
    } on HttpException catch (httpError) {
      return _showError("HTTP error: ${httpError.message}");
    } catch (e, stackTrace) {
      log('Unexpected Error: $e');
      log('Stack Trace: $stackTrace');

      _showError("Something went wrong, please try again.");
    }
    return null;
  }

  Future<Map<String, dynamic>?> postRequest(
    String endpoint,
    Map<String, dynamic> params, {
    File? profileImage,
    String profileImageKey = 'profile_pic',
  }) async {
    final url = Uri.parse(Apis.baseUrl + endpoint);

    log("Request Url:- $url");
    log("Request parametersl:- $params");

    try {
      var request = http.MultipartRequest('POST', url);

      // Add fields to the request
      params.forEach((key, value) {
        request.fields[key] = value.toString();
      });

      if (profileImage != null) {
        request.files.add(
          await http.MultipartFile.fromPath(profileImageKey, profileImage.path),
        );
        log('Profile Image Path: ${profileImage.path}');
      }

      // Send the request
      final response = await request.send();
      final responseData = await http.Response.fromStream(response);

      log('Response Code: ${response.statusCode}');
      log('Response Body: ${responseData.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseJson = jsonDecode(responseData.body);

        return responseJson;
      } else {
        TopMessageDialog.show(
          message: 'Error: ${response.statusCode} - ${response.reasonPhrase}',
        );
      }
    } on SocketException {
      TopMessageDialog.show(message: 'No internet connection.');

      log('SocketException: No internet connection');
      return null;
    } on HttpException catch (httpError) {
      TopMessageDialog.show(
        message: "'HTTP error occurred: ${httpError.message}'",
      );

      log('HttpException: ${httpError.message}');
      return null;
    } catch (e, stackTrace) {
      TopMessageDialog.show(message: "Something went wrong, please try again.");

      log('Error: $e');
      log('Stack Trace: $stackTrace');
      return null;
    }
    return null;
  }

  Future<Map<String, dynamic>?> postApi({
    required String endpoint,
    required Map<String, dynamic> body,
    bool? returnmsg,
  }) async {
    final Uri url = Uri.parse('${Apis.baseUrl}$endpoint');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        // Add auth token or other headers here if needed
      },
      body: jsonEncode(body),
    );

    log('POST Request URL: $url');
    log('POST Request Body: $body');
    log('Response Status: ${response.statusCode}');
    log('Response Body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    }
    return null;
  }
}
