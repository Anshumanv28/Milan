// //port 5000 or 8000
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'login_page.dart';
// import 'signup_page.dart';
//
// class WelcomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         SystemNavigator.pop(); // Exit the app directly
//         return false; // Prevent default back navigation behavior
//       },
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         // appBar: AppBar(
//         //   backgroundColor: Colors.white,
//         //   elevation: 0,
//         // ),
//         body: SafeArea(
//           child: SingleChildScrollView(
//             child: Container(
//               color: Colors.white, // Set the desired background color here
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   SizedBox(height: 50),
//                   // Logo section
//                   Container(
//                     height: 150,
//                     width: 150,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.5),
//                           spreadRadius: 3,
//                           blurRadius: 3,
//                           offset: Offset(-1.5, 1.5),
//                         ),
//                       ],
//                     ),
//                     child: Image.asset(
//                       'assets/images/logo.jpg',
//                       width: 150,
//                       height: 50,
//                     ),
//                   ),
//                   SizedBox(height: 25,),
//                   Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.5),
//                           spreadRadius: 0.5,
//                           blurRadius: 1.5,
//                           offset: Offset(-1.5, 3),),
//                       ],
//                     ),
//                     padding: EdgeInsets.all(20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.baseline,
//                           textBaseline: TextBaseline.alphabetic,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text('Staff', style: TextStyle(color: Colors.black87, fontSize: 30, fontWeight: FontWeight.w800)),
//                             SizedBox(width: 15),
//                             Text('Identification', style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 35)),
//                             SizedBox(width: 15),
//                           ],
//                         ),
//                         Row(
//                         children: [Container(
//                                     height: 1.5,
//                                     color: Colors.white,
//                                     width: 75,
//                                     ),
//                                     Container(
//                                     height: 1.5,
//                                     color: Colors.deepPurple,
//                                     width: 220,
//                                     ),
//                                   ],
//                             ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 140),
//                   Column(   //change this columns backgroud color to grey
//                     children: <Widget>[
//                       Container(
//                         width: 160,
//                         height: 80,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(38), // Adjust the border radius
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.4),
//                               spreadRadius: 1.5,
//                               blurRadius: 1.5,
//                               offset: Offset(-1, 1.5),
//                             ),
//                           ],
//                         ),
//                         child: OutlinedButton(
//                           onPressed: (){
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => SignupPage()),);
//                           },
//                           style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
//                           ),
//                           child: Text(
//                             "Sign Up",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 35),
//                       Container(
//                         width: 160,
//                         height: 80,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(38), // Adjust the border radius
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.4),
//                               spreadRadius: 1.5,
//                               blurRadius: 1.5,
//                               offset: Offset(-1, 1.5),
//                             ),
//                           ],
//                         ),
//                         child: OutlinedButton(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => LoginPage()),);
//                           },
//                           style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
//                           ),
//                           child: Text(
//                             "Login",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 110,),
//                       SizedBox(
//                         height: 20,
//                         width: 200,
//                         child: Text('  Designed and Created by',
//                           style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15,
//                               fontFamily: 'LibreBaskerville-Italic'),),
//                       ),
//                       SizedBox(
//                         height: 30,
//                         width: 120,
//                         child: Text('DSA Tech Team',
//                           style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15,
//                               fontFamily: 'LibreBaskerville-Italic'),),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// // return Scaffold(
// //   backgroundColor: Colors.white,
// //   body: Center(
// //     child: Column(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children: <Widget>[
// //         Image.asset(
// //           'assets/images/logo.jpg',
// //           width: 100,
// //           height: 100,
// //         ),
// //         SizedBox(height: 20),
// //         Text(
// //           "Welcome",
// //           style: TextStyle(
// //             color: Colors.white,
// //             fontSize: 24,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         SizedBox(height: 50),
// //         SizedBox(
// //           width: 140,
// //           height: 60,
// //           child: ElevatedButton(
// //             onPressed: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (context) => LoginPage()),
// //               );
// //             },
// //             child: Text(
// //               "Login",
// //               style:
// //               TextStyle(fontSize: 20,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             style: ElevatedButton.styleFrom(
// //               padding: EdgeInsets.all(5),
// //               backgroundColor: Color(0xFFF02B2B),
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(10),
// //               ),
// //             ),
// //           ),
// //         ),
// //         SizedBox(height: 15),
// //         SizedBox(
// //           width: 140,
// //           height: 60,
// //           child: ElevatedButton(
// //             onPressed: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (context) => SignupPage()),
// //               );
// //             },
// //             child: Text("Sign Up", style: TextStyle(
// //               fontSize: 20,
// //               fontWeight: FontWeight.bold,
// //             ),
// //             ),
// //             style: ElevatedButton.styleFrom(
// //               padding: EdgeInsets.all(15),
// //               backgroundColor: Color(0xFFF02B2B),
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(10),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     ),
// //   ),
// // );