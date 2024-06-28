// import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// import 'package:lottie/lottie.dart';
// import 'selection_page.dart';
// import 'forgot_password.dart';
// import 'api_services.dart';
//
// // SelectionPage(
// // username: username, contact: contact)));
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// String responseBody = "";
// Map<String, dynamic>? responseJson;
//
// class _LoginPageState extends State<LoginPage> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   bool isLoading = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Log-In', style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             FocusScope.of(context).unfocus();
//             Future.delayed(Duration(milliseconds: 300), () {
//               Navigator.pop(context);
//             });
//           },
//           color: Colors.white,
//         ),
//         backgroundColor: Colors.black,
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 SizedBox(height: 30),
//                 Text(
//                   "Welcome Back!",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 40),
//                 SizedBox(
//                   width: 380,
//                   height: 60,
//                   child: TextFormField(
//                     controller: emailController,
//                     decoration: InputDecoration(
//                       hintText: "E-mail",
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 SizedBox(
//                   width: 380,
//                   height: 60,
//                   child: TextFormField(
//                     controller: passwordController,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       hintText: "Password",
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 50),
//                 Container(
//                   width: 160,
//                   height: 80,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(38),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.4),
//                         spreadRadius: 1.5,
//                         blurRadius: 1.5,
//                         offset: Offset(-1, 1.5),
//                       ),
//                     ],
//                   ),
//                   child: OutlinedButton(
//                     onPressed: () async {
//                       print('logging in...');
//                       setState(() {
//                         isLoading = true; // Set loading state to true
//                       });
//                       final email = emailController.text;
//                       final password = passwordController.text;
//                       try {
//                         final responseJson = await ApiService.login(email, password);
//
//                         if (responseJson != null) {
//                           print("success");
//                           if (responseJson['message_code'] == 'USER_NOT_VERIFIED') {
//                             // Show error message for user not verified
//                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                               content: Text("User not verified. Please verify your account."),
//                             ));
//                           }else if(responseJson['message_code'] == 'INVALID_PASSWORD'){
//                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                               content: Text("Wrong Password.Try Again"),
//                             ));
//                           } else if(responseJson['message_code'] == 'USER_NOT_FOUND'){
//                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                               content: Text("Wrong Email. NO user with this email exists"),
//                             ));
//                           }
//                           final username = responseJson['data']['user']['name'] as String? ?? 'default username';
//                           // final contact = responseJson['data']['user']['phoneNumber'] as String? ?? '1001001001';
//                           final userid = responseJson['data']['user']['id'] as String? ?? 'didNotGetIdBro';
//                           // final club = responseJson['data']['user']['club_name'] as String ?? 'No_club';
//                           print("🍀🍀🍀🍀🍀🍀🍀loginPage");
//                           print(userid);
//                           print(username);
//                           Navigator.push(context, MaterialPageRoute(
//                             builder: (context) => SelectionPage(username: username, userid: userid)));
//                         }
//                         else {
//                           print('Error: Login failed.');
//                           // Show a Snackbar message and allow the user to try again
//                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                             content: Text("Login Failed. Please try again."),
//                           ));
//                         }
//                       } catch (e) {
//                         // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                         //   content: Text("Login Failed. Please try again."),
//                         // ));
//                         print('error: $e');
//                       } finally {
//                         setState(() {
//                           isLoading = false;
//                         });
//                       }
//                     },
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
//                     ),
//                     child: isLoading
//                         ? Lottie.asset('assets/animations/Animation - 1704788076072.json',fit: BoxFit.contain,)
//                         : Text(
//                       "Verify",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 50),
//                 Container(
//                   width: 160,
//                   height: 40,
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
//                       );
//                     },
//                     child: Text(
//                       'Forgot Password?',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
