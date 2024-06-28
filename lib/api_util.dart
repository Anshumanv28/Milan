import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

const urlForDifferentDebugDeviceHotspot= "http://10.3.36.17:5000/api/staff/register";   //update from ipconfig
const urlForSameDebugDeviceHotspot= "http://192.168.210.125:5000/api/staff/register";   //update from ipconfig

class ApiUtil {
  static Future<ApiResponse> submitDetails(BuildContext context, String userId, String paymentId, String ticketId) async {
    // print('I came here');
    if (userId.isEmpty || paymentId.isEmpty || ticketId.isEmpty) {
      return ApiResponse(false, 'Missing required data');
    }

    try {
      var headers = {'Content-Type': 'application/json'};

      var request = http.Request(
        'PATCH',
        Uri.parse('https://api.srmmilan.org/api/bookings/updateticketissued'),
      );
      request.body = json.encode({
        "user_id": userId,

        "payment_id": paymentId,
        "ticket_id": ticketId
      });
      print(request.body);
      request.headers.addAll(headers);
      print(request);
      // print("🍀🍀🍀🍀🍀🍀🍀ok so far");

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      print("response Body: $responseBody");
      Map<String, dynamic> responseJson = json.decode(responseBody);
      String message = responseJson['message'];
      print('okokokokokokokok');

      if (response.statusCode == 200) {
        print(responseJson);
        print("going here");
        print(response);
        // String name = responseJson['data']?['name'] ?? 'N/A';
        // String email = responseJson['data']?['email'] ?? 'N/A';
        // String regNo = responseJson['data']?['reg_number'] ?? 'N/A';

        // Show SnackBar for successful submission
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Submission successful!'),
            duration: Duration(seconds: 2),
          ),
        );

        return ApiResponse(true, responseBody);
      } else {
        // Show SnackBar for failed submission
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Submission failed: ${response.reasonPhrase}'),
            duration: Duration(seconds: 2),
          ),
        );

        return ApiResponse(false, message);
      }
    } catch (e) {
      print('Error: $e');
      return ApiResponse(false, 'Error: $e');
    }
  }
}

class ApiResponse {
  final bool success;
  final String message;

  ApiResponse(this.success, this.message);
}
