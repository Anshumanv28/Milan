// import 'package:VibeCheck/welcome_page.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// // import 'package:VibeCheck/selection_page.dart';
// // import 'package:intl/intl.dart';
//
// class ResetSuccessPage extends StatelessWidget {
//   final Map<String, dynamic>? message;
//   late String email;
//   late String passwd;
//   late String name;
//   late String regNo;
//   late String price;
//   ResetSuccessPage({required this.message}) {
//     // Check if message is not null before accessing its properties
//     name = message?['data']?['name'] ?? 'N/A';
//     email = message?['data']?['email'] ?? 'N/A';
//     passwd = message?['data']?['passwd']??'N/A';
//     regNo = message?['data']?['reg_number'] ?? 'N/A';
//     price = message?['data']?['price']?? 'N/A';
//     // bookedAt = message?['data']?['created_at']?? 'N/A';
//     // DateTime utcTime = DateTime.parse(bookedAt);
//
//     // Convert UTC time to IST
//     // DateTime istTime = utcTime.toLocal();
//
//     // Format IST time as a string
//     // bookedAt = DateFormat('yyyy-MM-dd HH:mm:ss').format(istTime);
//   }
//   @override
//   Widget build(BuildContext context) {
//     print("Building ForgotPasswordPage"); // Add a print statement
//     // Your build method code
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Reset Successful', style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor: Colors.green, // You can customize the color
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(height: 50,),
//               Container(
//                 width: 200,
//                 height: 200,
//                 child: Lottie.asset(
//                   'assets/animations/Animation - 1704787657189.json', // Replace with your Lottie animation file
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Reset Successful!😉',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 40),
//               Text('Name: $name',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               // Text('Reg_No: $regNo',
//               //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               // ),
//               // SizedBox(height: 20),
//               Text('Email: $email',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 70,),
//               Container(
//                 width: 160,
//                 height: 80,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(38), // Adjust the border radius
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
//                   onPressed: (){
//                     Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(builder: (context) => WelcomePage()),
//                       ModalRoute.withName('/WelcomePage'),);
//                   },
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
//                   ),
//                   child: Text(
//                     "Done",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               // SizedBox(height: 30,),
//               // Container(
//               //   width: 160,
//               //   height: 80,
//               //   decoration: BoxDecoration(
//               //     borderRadius: BorderRadius.circular(38), // Adjust the border radius
//               //     boxShadow: [
//               //       BoxShadow(
//               //         color: Colors.black.withOpacity(0.4),
//               //         spreadRadius: 1.5,
//               //         blurRadius: 1.5,
//               //         offset: Offset(-1, 1.5),
//               //       ),
//               //     ],
//               //   ),
//               //   child: OutlinedButton(
//               //     onPressed: () {
//               //       Navigator.pop(context);
//               //     },
//               //     style: ButtonStyle(
//               //       backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
//               //     ),
//               //     child: Text(
//               //       "Retry",
//               //       style: TextStyle(
//               //         fontSize: 20,
//               //         fontWeight: FontWeight.bold,
//               //       ),
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
