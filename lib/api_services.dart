import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'db.dart';
// import 'event_user_model.dart';
// import 'team_model.dart';
// import 'event_model.dart';
// import 'user_model.dart';

const addressForSameDebugDeviceHotspot = "api.srmmilan.org";

class ApiService {

  static Future<ApiResponse> submitDetails(BuildContext context, String email, String paymentId, String ticketId, int serialNumber) async {
    if (email.isEmpty || paymentId.isEmpty || ticketId.isEmpty) {
      return ApiResponse(false, 'Missing required data');
    }

    // Provide default values or handle null cases for staffName and staffId

    try {
      var headers = {'Content-Type': 'application/json'};

      // var request = http.Request('PATCH', Uri.parse("https://$addressForSameDebugDeviceHotspot/api/bookings/updateticketissued"),
      var request = http.Request('PATCH', Uri.parse("https://$addressForSameDebugDeviceHotspot/api/bookings/onSpotBookingUpdate"),
      // var request = http.Request('PATCH', Uri.parse("http://192.168.152.125:5000/api/bookings/onSpotBookingUpdate"),
      );
      request.body = json.encode({
        "email": email,
        "payment_id": paymentId,
        "ticket_id": ticketId,
        "serial_number": serialNumber
      });
      print(request.body);
      request.headers.addAll(headers);
      print(request);
      // print("🍀🍀🍀🍀🍀🍀🍀ok so far");

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      print(response.statusCode);
      print("response Body: $responseBody");
      Map<String, dynamic> responseJson = json.decode(responseBody);
      String message = responseJson['message'];
      print(responseJson);
      // print(responseJson['data']['ticket_type']);
      // print(responseJson['data']['serial_number']);

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
      }else if(response.statusCode == 400){
        print("going here");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Submission failed!'),
            duration: Duration(seconds: 2),
          ),
        );

        return ApiResponse(false, responseJson['message']);
      }
      else {
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
      print('💥🍀⛔📦📦⛔🍀💥📦⛔');
      print('Error: $e');
      return ApiResponse(false, 'Error: $e');
    }
  }

  static Future<Map<String, dynamic>> resetPassword(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return {'success': false, 'message': 'Email or password is empty'};
    }

    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse("https://$addressForSameDebugDeviceHotspot/api/staff/forgotpassword")); // Adjust the URL as needed
      request.body = json.encode({
        "email": email,
        "password": password,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> responseJson = json.decode(responseBody);

      if (response.statusCode == 200) {
        // Password reset successful
        return {'success': true, 'message': 'Password reset successful', 'data': responseJson};
      } else {
        // Password reset failed
        return {'success': false, 'message': 'Password reset failed', 'data': responseJson};
      }
    } catch (e) {
      print('Error: $e');
      return {'success': false, 'message': 'Error: $e'};
    }
  }


  static Future<Map<String, dynamic>?> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return null;
    }
    try {
      var headers = {
        'Content-Type': 'application/json'
      };

      var request = http.Request(
          'POST', Uri.parse("https://$addressForSameDebugDeviceHotspot/api/staff/login"));

      request.body = json.encode({
        "email": email,
        "password": password,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      // print(response.statusCode);
      var responseBody = await response.stream.bytesToString();
      var responseJson = json.decode(responseBody);
      print(responseJson['message_code']);

      if(responseJson['message_code'] == 'USER_NOT_VERIFIED' || responseJson['message_code'] == 'INVALID_PASSWORD' || responseJson['message_code'] == 'USER_NOT_FOUND'){
        // print('💥💥💥💥🤔🤔');
        print(responseJson);
        return responseJson;
      }

      if (response.statusCode == 200 && responseJson['data'] != null) {
        // var userData = responseJson['data']['user'];
        var userData = responseJson;
        print(userData);

        if (userData != null) {
          // print(userData);
          return userData;
        } else {
          print("User data not found in response.");
          return null;
        }
      } else {
        print(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }


  static Future<Map<String, dynamic>?> signUp(String name, String password, String email, String phno, String role, String club) async {
    // Validate the username and password.
    if (name.isEmpty || password.isEmpty) {
      return null;
    }

    try {
      var headers = {
        'Content-Type': 'application/json'
      };

      var request = http.Request('POST', Uri.parse("https://$addressForSameDebugDeviceHotspot/api/staff/register"));
      request.body = json.encode({
        "name": name,
        "email": email,
        "password": password,
        "phone_number": int.parse(phno),
        // "reg_number": reg_no,
        // "is_verified": true,
        "club_name": club,
        "role": role,
      });
      request.headers.addAll(headers);

      print(request.body);
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      print(response.reasonPhrase);

      var responseBody = await response.stream.bytesToString();
      var responseJson = json.decode(responseBody);
      if (response.statusCode == 200) {
        print("success");

        // If sign up is successful, store user details in the local database
        return responseJson; // Successful SignUp
      } else {
        print("💥💥💥💥💥💥");
        return responseJson; // Failed SignUp
      }
    } catch (e) {
      print('Error signing up: $e');
      return null; // Handle any exceptions as a failed SignUp
    }
  }

  // static Future<List<Member>> fetchTeamMembers(String teamId) async{
  //   try {
  //     print(teamId);
  //     print('requesting💥💥💥💥💥💥');
  //     final response = await http.get(Uri.parse("http://$addressForSameDebugDeviceHotspot:5000/api/teams/getAllTeamMembers/$teamId"));
  //
  //     if (response.statusCode == 200) {
  //       print('working');
  //       final dynamic responseBody = json.decode(response.body);
  //       if (responseBody != null && responseBody['data'] != null) {
  //         print(responseBody);
  //         final List<dynamic> membersData = responseBody['data'];
  //         List<Member> members = membersData.map((memberData) => Member.fromJson(memberData)).toList();
  //         print(members);
  //         return members;
  //       } else {
  //         throw Exception('No members found in response');
  //       }
  //     } else {
  //       throw Exception('Failed to load members. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     throw Exception('Error fetching members: $error');
  //   }
  // }

  // static Future<List<Member>> fetchUserTeam(String eventCode, String id) async{
  //   try {
  //     final response = await http.get(Uri.parse(  "http://$addressForSameDebugDeviceHotspot:5000/api/teams/getUserTeamForEvent/$eventCode/$id"));
  //
  //     if (response.statusCode == 200) {
  //       final dynamic responseBody = json.decode(response.body);
  //       if (responseBody != null && responseBody['data'] != null) {
  //         final List<dynamic> membersData = responseBody['data'];
  //         List<Member> members = membersData.map((memberData) => Member.fromJson(memberData)).toList();
  //         return members;
  //       } else {
  //         throw Exception('No members found in response');
  //       }
  //     } else {
  //       throw Exception('Failed to load members. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     throw Exception('Error fetching members: $error');
  //   }
  // }

  // static Future<List<Member>> fetchTeamMemberDetails(String teamId) async {
  //   try {
  //     final response = await http.get(Uri.parse(  "http://$addressForSameDebugDeviceHotspot:5000/api/teams/getAllTeamMembers/$teamId"));
  //
  //     if (response.statusCode == 200) {
  //       final dynamic responseBody = json.decode(response.body);
  //       if (responseBody != null && responseBody['data'] != null) {
  //         final List<dynamic> membersData = responseBody['data'];
  //         List<Member> members = membersData.map((memberData) => Member.fromJson(memberData)).toList();
  //         return members;
  //       } else {
  //         throw Exception('No members found in response');
  //       }
  //     } else {
  //       throw Exception('Failed to load members. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     throw Exception('Error fetching members: $error');
  //   }
  // }

  // static Future<Team> fetchTeamDetails(String teamCode) async {
  //   try {
  //     // print(userId);
  //     final response = await http.get(Uri.parse("http://$addressForSameDebugDeviceHotspot:5000/api/teams/getTeamByTeamCode/$teamCode"));
  //     // print(response.body);
  //     if (response.statusCode == 200) {
  //       final dynamic responseBody = json.decode(response.body);
  //       if (responseBody != null) {
  //         print(responseBody['data']);
  //         // Assuming your user model is named User and has a fromJson method
  //         Team? team = Team.fromJson(responseBody['data']);
  //         // print(user);
  //         return team;
  //       } else {
  //         throw Exception('No team details found in response');
  //       }
  //     } else {
  //       throw Exception('Failed to fetch team details. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     throw Exception('Error fetching team details: $error');
  //   }
  // }

  // static Future<User> fetchUserDetails(String userId) async {
  //   try {
  //     // print(userId);
  //     final response = await http.get(Uri.parse("http://$addressForSameDebugDeviceHotspot:5000/api/staff/getUserByUserID/$userId"));
  //     // print(response.body);
  //     if (response.statusCode == 200) {
  //       final dynamic responseBody = json.decode(response.body);
  //       if (responseBody != null) {
  //         print(responseBody['data']);
  //         // Assuming your user model is named User and has a fromJson method
  //         User? user = User.fromJson(responseBody['data']);
  //         // print(user);
  //         return user;
  //       } else {
  //         throw Exception('No user details found in response');
  //       }
  //     } else {
  //       throw Exception('Failed to fetch user details. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     throw Exception('Error fetching user details: $error');
  //   }
  // }

  // static Future<List<Event>> fetchEventsByClub(String club) async {
  //   try {
  //     final response = await http.get(Uri.parse("http://$addressForSameDebugDeviceHotspot:5000/api/events/getEventByClub/$club"));
  //     if (response.statusCode == 200) {
  //       final dynamic responseBody = json.decode(response.body);
  //       if (responseBody != null && responseBody['data'] != null) {
  //         final List<dynamic> eventsData = responseBody['data'];
  //         List<Event> events = eventsData.map((eventData) => Event.fromJson(eventData)).toList();
  //         return events;
  //       } else {
  //         throw Exception('No club events found in response');
  //       }
  //     } else {
  //       throw Exception('Failed to load club events. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     throw Exception('Error fetching events: $error');
  //   }
  // }

  // static Future<List<Event>> fetchEvents() async {
  //   try {
  //     final response = await http.get(Uri.parse("http://$addressForSameDebugDeviceHotspot:5000/api/events"));
  //     if (response.statusCode == 200) {
  //       final dynamic responseBody = json.decode(response.body);
  //       if (responseBody != null && responseBody['data'] != null) {
  //         final List<dynamic> eventsData = responseBody['data'];
  //         List<Event> events = eventsData.map((eventData) => Event.fromJson(eventData)).toList();
  //         return events;
  //       } else {
  //         throw Exception('No events found in response');
  //       }
  //     } else {
  //       throw Exception('Failed to load events. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     throw Exception('Error fetching events: $error');
  //   }
  // }

  // static Future<List<Team>> fetchTeams(String eventCode) async {
  //   try {
  //     final response = await http.get(Uri.parse("http://$addressForSameDebugDeviceHotspot:5000/api/teams/getAllTeamsOfEvent/$eventCode"));
  //     if (response.statusCode == 200) {
  //       final dynamic responseBody = json.decode(response.body);
  //       if (responseBody != null && responseBody['data'] != null) {
  //         final List<dynamic> teamData = responseBody['data'];
  //         print(teamData);
  //
  //         List<Team> teams = teamData.map((teamsData) => Team.fromJson(teamsData)).toList();
  //         return teams;
  //         // List<Team> teamList = teamData.map((teamData) {
  //         //   return Team(
  //         //     id: teamData['id'],
  //         //     teamName: teamData['team_name'],
  //         //     teamCode: teamData['team_code'],
  //         //     eventId: teamData['event_id'],
  //         //     eventCode: teamData['event_code'] ?? '',
  //         //     createdAt: DateTime.parse(teamData['created_at']),
  //         //     updatedAt: teamData['updated_at'] != null ? DateTime.parse(teamData['updated_at']) : null,
  //         //   );
  //         // }).toList();
  //         // return teamList;
  //       } else {
  //         throw Exception('No teams found in response');
  //       }
  //     } else {
  //       throw Exception('Failed to fetch teams data. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     throw Exception('Error fetching teams data: $error');
  //   }
  // }

  // static Future<List<EventUser>> fetchEventUsers(String eventCode) async {
  //   try {
  //     final response = await http.get(Uri.parse("http://$addressForSameDebugDeviceHotspot:5000/api/events/getEventUsersByCode/$eventCode"));
  //     if (response.statusCode == 200) {
  //       final dynamic responseBody = json.decode(response.body);
  //       if (responseBody != null && responseBody['data'] != null) {
  //         final List<dynamic> eventUserData = responseBody['data'];
  //
  //         List<EventUser> eventUsers = eventUserData.map((eventUsersData) => EventUser.fromJson(eventUsersData)).toList();
  //         return eventUsers;
  //         // List<EventUser> eventUsers = eventsData.map((userData) {
  //         //   return EventUser(
  //         //     id: userData['id'],
  //         //     userId: userData['user_id'],
  //         //     eventId: userData['event_id'],
  //         //     eventCode: userData['event_code'] ?? '',
  //         //     userName: userData['user_name'] ?? '',
  //         //     createdAt: DateTime.parse(userData['created_at']),
  //         //     updatedAt: userData['updated_at'] != null ? DateTime.parse(userData['updated_at']) : null,
  //         //   );
  //         // }).toList();
  //         // return eventUsers;
  //       } else {
  //         throw Exception('No users found in response');
  //       }
  //     } else {
  //       throw Exception('Failed to fetch users data. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     throw Exception('Error fetching users data: $error');
  //   }
  // }

  static Future<bool> activateEvent(String eventCode, String op) async {
    try {
      final response = await http.patch(Uri.parse("https://$addressForSameDebugDeviceHotspot/api/events/activateEvent/$eventCode/$op"));
      if (response.statusCode == 200) {
        // Event activated successfully
        return true;
      } else {
        throw Exception('Failed to activate event. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error activating event: $error');
    }
  }

  // static Future<Event?> fetchEventByCode(String eventCode) async {
  //   try {
  //     final response = await http.get(Uri.parse("http://$addressForSameDebugDeviceHotspot:5000/api/events/$eventCode"));
  //     print('Response status code: ${response.statusCode}');
  //     print('Response body: ${response.body}');
  //
  //     if (response.statusCode == 200) {
  //       final dynamic responseBody = json.decode(response.body);
  //       if (responseBody != null && responseBody['data'] != null) {
  //         // Assuming your event model is named Event and has a fromJson method
  //         Event event = Event.fromJson(responseBody['data']);
  //         return event;
  //       } else {
  //         throw Exception('No event found in response');
  //       }
  //     } else {
  //       throw Exception('Failed to fetch event. Status code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     throw Exception('Error fetching event: $error');
  //   }
  // }
}

class ApiResponse {
  final bool success;
  final String message;

  ApiResponse(this.success, this.message);
}
