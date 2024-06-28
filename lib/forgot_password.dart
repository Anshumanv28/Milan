// import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// import 'package:lottie/lottie.dart';
// import 'reset_success.dart';
// import 'api_services.dart';
// // import 'package:email_validator/email_validator.dart';
//
// class ForgotPasswordPage extends StatefulWidget {
//   @override
//   _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
// }
//
// Map<String, dynamic>? responseJson;
//
// class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//
//   bool isLoading = false;
//
//   Future<void> _resetPassword() async {
//     setState(() {
//       isLoading = true;
//     });
//     final password = passwordController.text;
//     final email = emailController.text;
//     try {
//       final response = await ApiService.resetPassword(email, password);
//       if (response['success']) {
//         print(response['data']);
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ResetSuccessPage(message: response['data']),
//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text("Reset Failed. Please try again."),
//         ));
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text("Reset Failed. Please try again."),
//       ));
//       print('error: $e');
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Password Reset', style: TextStyle(color: Colors.white)),
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
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               SizedBox(height: 50),
//               Text(
//                 'Enter details to reset password',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 50),
//               SizedBox(
//                 width: 380,
//                 height: 60,
//                 child: TextFormField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     hintText: "Email",
//                     fillColor: Colors.white,
//                     filled: true,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 25),
//               SizedBox(
//                 width: 380,
//                 height: 60,
//                 child: TextFormField(
//                   controller: passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     hintText: "New Password",
//                     fillColor: Colors.white,
//                     filled: true,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 40.0),
//               Container(
//                 width: 160,
//                 height: 80,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(38),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.4),
//                       spreadRadius: 1.5,
//                       blurRadius: 1.5,
//                       offset: Offset(-1, 1.5),
//                     ),
//                   ],
//                 ),
//                 child: OutlinedButton(
//                   onPressed: _resetPassword,
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
//                   ),
//                   child: isLoading
//                       ? Lottie.asset('assets/animations/Animation - 1704788076072.json',fit: BoxFit.contain,)
//                       : Text(
//                     "Reset",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
