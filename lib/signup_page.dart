// import 'package:VibeCheck/welcome_page.dart';
// import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';
// // import 'package:milan_events/events_page.dart';
// // import 'events_page.dart';
// // import 'selection_page.dart';
// import 'package:lottie/lottie.dart';
// import 'dart:async';
// import 'api_services.dart';
//
// class SignupPage extends StatefulWidget {
//   @override
//   _SignupPageState createState() => _SignupPageState();
// }
//
// String responseBody = "";
// Map<String, dynamic>? responseJson;
//
// class _SignupPageState extends State<SignupPage> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneNumberController = TextEditingController();
//   // TextEditingController regNoController = TextEditingController();
//
//   String? selectedRole;
//   String? selectedClub;
//   List<String> club_name = ["Music", "Dance", "Fashion", "MoviesAndDramatics ", "Literary", "CreativeArts", "Quiz", "Gaming", "SelfDefence", "Sports", "Rubiks", "Rotaract", "WomenEmpowerment", "Social", "Astrophilia", "Photography", "FunZonePublicity",];
//
//   bool isLoading = false;
//   bool signUpSuccess = false;
//
//   //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();   // for emailvalidation can add later
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Sign-Up', style: TextStyle(color: Colors.white)),
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
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 // SizedBox(height: 50),
//                 Text(
//                   "Enter details",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 SizedBox(
//                   width: 380,
//                   height: 60,
//                   child: TextFormField(
//                     controller: nameController,
//                     decoration: InputDecoration(
//                       hintText: "name",
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 25),
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
//                 SizedBox(height: 25),
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
//                 SizedBox(height: 25),
//                 SizedBox(
//                   width: 380,
//                   height: 60,
//                   child: TextFormField(
//                     controller: phoneNumberController,
//                     keyboardType: TextInputType.phone, // This restricts the input to numbers.
//                     decoration: InputDecoration(
//                       hintText: "Phone Number",
//                       fillColor: Colors.white,
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 25),
//                 // SizedBox(
//                 //   width: 380,
//                 //   height: 60,
//                 //   child: TextFormField(
//                 //     controller: regNoController,
//                 //     decoration: InputDecoration(
//                 //       hintText: "Register Number",
//                 //       fillColor: Colors.white,
//                 //       filled: true,
//                 //       border: OutlineInputBorder(
//                 //         borderRadius: BorderRadius.circular(10),
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//                 // SizedBox(height: 25),
//                 // SizedBox(
//                 //   width: 380,
//                 //   height: 60,
//                 //   child: DropdownButtonFormField(
//                 //     decoration: InputDecoration(
//                 //       hintText: "Select Role",
//                 //       labelText: "Role",
//                 //       fillColor: Colors.white,
//                 //       filled: true,
//                 //       border: OutlineInputBorder(
//                 //         borderRadius: BorderRadius.circular(10),
//                 //       ),
//                 //     ),
//                 //     value: selectedRole, // Set initial value to null
//                 //     items: ["scanner", "convenor", "admin"].map((role) {
//                 //       return DropdownMenuItem(
//                 //         value: role,
//                 //         child: Column(
//                 //           crossAxisAlignment: CrossAxisAlignment.start,
//                 //           children: [
//                 //             Text(
//                 //               role,
//                 //               style: TextStyle(
//                 //                 color: Colors.deepPurpleAccent, // Customize text color
//                 //                 fontSize: 16, // Customize text size
//                 //               ),
//                 //             ),
//                 //             Divider(
//                 //               color: Colors.black, // Customize line color
//                 //             ),
//                 //           ],
//                 //         ),
//                 //       );
//                 //     }).toList(),
//                 //     onChanged: (value) {
//                 //       setState(() {
//                 //         selectedRole = value!;
//                 //       });
//                 //     },
//                 //     style: TextStyle(color: Colors.black), // Customize dropdown button text color
//                 //     icon: Icon(Icons.arrow_drop_down), // Customize dropdown icon
//                 //     iconSize: 24, // Customize dropdown icon size
//                 //     elevation: 16, // Customize dropdown elevation
//                 //     isDense: true, // Reduce vertical spacing between dropdown items
//                 //     dropdownColor: Colors.white, // Customize dropdown background color
//                 //     selectedItemBuilder: (BuildContext context) {
//                 //       return ["scanner", "convenor", "admin"].map<Widget>((String value) {
//                 //         return Text(
//                 //           value,
//                 //           style: TextStyle(
//                 //             color: Colors.deepPurple, // Customize selected item text color
//                 //             fontSize: 16, // Customize selected item text size
//                 //           ),
//                 //         );
//                 //       }).toList();
//                 //     },
//                 //   ),
//                 // ),
//                 // SizedBox(height: 25),
//                 // SizedBox(
//                 //   width: 380,
//                 //   height: 60,
//                 //   child: DropdownButtonFormField(
//                 //     decoration: InputDecoration(
//                 //       hintText: "Select Club",
//                 //       labelText: "Club",
//                 //       fillColor: Colors.white,
//                 //       filled: true,
//                 //       border: OutlineInputBorder(
//                 //         borderRadius: BorderRadius.circular(10),
//                 //       ),
//                 //     ),
//                 //     value: selectedClub, // Set initial value to null
//                 //     items: club_name.map((club) {
//                 //       return DropdownMenuItem(
//                 //         value: club,
//                 //         child: Column(
//                 //           crossAxisAlignment: CrossAxisAlignment.start,
//                 //           children: [
//                 //             Text(
//                 //               club,
//                 //               style: TextStyle(
//                 //                 color: Colors.deepPurpleAccent, // Customize text color
//                 //                 fontSize: 16, // Customize text size
//                 //               ),
//                 //             ),
//                 //             Divider(
//                 //               color: Colors.black, // Customize line color
//                 //             ),
//                 //           ],
//                 //         ),
//                 //       );
//                 //     }).toList(),
//                 //     onChanged: (value) {
//                 //       setState(() {
//                 //         selectedClub = value!;
//                 //       });
//                 //     },
//                 //     style: TextStyle(color: Colors.black), // Customize dropdown button text color
//                 //     icon: Icon(Icons.arrow_drop_down), // Customize dropdown icon
//                 //     iconSize: 24, // Customize dropdown icon size
//                 //     elevation: 16, // Customize dropdown elevation
//                 //     isDense: true, // Reduce vertical spacing between dropdown items
//                 //     dropdownColor: Colors.white, // Customize dropdown background color
//                 //     selectedItemBuilder: (BuildContext context) {
//                 //       return club_name.map<Widget>((String value) {
//                 //         return Text(
//                 //           value,
//                 //           style: TextStyle(
//                 //             color: Colors.deepPurple, // Customize selected item text color
//                 //             fontSize: 16, // Customize selected item text size
//                 //           ),
//                 //         );
//                 //       }).toList();
//                 //     },
//                 //   ),
//                 // ),
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
//                       print('Signing up...');
//                       setState(() {
//                         isLoading = true; // Set loading state to true
//                       });
//                       final name = nameController.text;
//                       final password = passwordController.text;
//                       final email = emailController.text;
//                       final phno = phoneNumberController.text;
//                       // final role = selectedRole;
//                       final role = "scanner";
//                       // final reg_no = regNoController.text;
//                       // final club = selectedClub;
//                       final club = "treasury";
//                       try {
//                         final responseJson = await ApiService.signUp(name, password, email, phno, role!, club!);
//                         print(responseJson);
//                         // Check if the sign-up was successful based on the response
//                         if (responseJson != null && responseJson['success'] == true) {
//                           print("success");
//                           // Extract user details from the response
//                           final username = responseJson['data']['user']['name'] as String? ?? 'default username';
//                           // final username = userJson['name'] as String? ?? 'default username';
//                           // final contact = userJson['phone_number'] as String? ?? '1001001001';
//                           // final club = responseJson['data']['user']['club_name'] as String ?? 'No_club';
//                           final userid = responseJson['data']['user']['id'] as String? ?? 'didNotGetIdBro';
//
//                           // Navigate to the EventsPage after a successful signup
//                           // Navigator.push(context, MaterialPageRoute(builder: (context) => SelectionPage(username: username, userid: userid)));
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage()));
//
//                         } else {
//                           print('Error: Signup failed.');
//                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                             content: Text("Signup Failed. ${responseJson?['message']}"),
//                           ));
//                         }
//                       } catch (e) {
//                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                           content: Text("Signup Failed. Please try again."),
//                         ));
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
//                       "SignUp",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
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
