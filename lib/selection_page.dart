// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'verified.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Milan2/Entry_page.dart';
import 'package:Milan2/scanner_page.dart';

class SelectionPage extends StatelessWidget {
  // final String? username;
  // final String? userid;

  void _showExitConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Exit'),
        content: Text('Do you want to exit the app?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('yes'),
          ),
        ],
      ),
    ).then((exitConfirmed) {
      if (exitConfirmed == true) {
        // Exit the app logic
        SystemNavigator.pop();
      }
    });
  }

  // SelectionPage({required this.username, required this.userid});
  @override
  Widget build(BuildContext context) {
    print("🍀🍀🍀🍀🍀🍀🍀SelectionPage");
    // print(userid);
    // print(username);
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop(); // Exit the app directly
        return false; // Prevent default back navigation behavior
      },
    child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.exit_to_app, color: Colors.black), // Use exit_to_app icon
          onPressed: () => _showExitConfirmationDialog(context),
        ),
        // backgroundColor: Color.fromRGBO(9, 38, 53, 10),
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white, // Set the desired background color here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50),
                // Logo section
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: Offset(-1.5, 1.5),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/logo.jpg',
                    width: 150,
                    height: 50,
                  ),
                ),
                SizedBox(height: 25,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 0.5,
                        blurRadius: 1.5,
                        offset: Offset(-1.5, 3),),
                    ],
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Choose your', style: TextStyle(color: Colors.black87, fontSize: 20)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Verification', style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 35)),
                          SizedBox(width: 5),
                          Text('method', style: TextStyle(color: Colors.black87, fontSize: 20)),
                        ],
                      ),
                      Container(
                        height: 1.5,
                        color: Colors.deepPurple,
                        width: 180,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 150),
                Column(   //change this columns backgroud color to grey
                  children: <Widget>[
                    Container(
                      width: 160,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(38), // Adjust the border radius
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 1.5,
                            blurRadius: 1.5,
                            offset: Offset(-1, 1.5),
                          ),
                        ],
                      ),
                      child: OutlinedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ScannerPage()));
                            //   MaterialPageRoute(builder: (context) => VerifiedPage(message: {},)));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Text(
                          "Scan QR",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      width: 160,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(38), // Adjust the border radius
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 1.5,
                            blurRadius: 1.5,
                            offset: Offset(-1, 1.5),
                          ),
                        ],
                      ),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DataEntryPage()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Text(
                          "Manual",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 110,),
                    SizedBox(
                      height: 20,
                      width: 170,
                      child: Text('Designed & Created by',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15,
                      fontFamily: 'LibreBaskerville-Italic'),),
                    ),
                    SizedBox(
                      height: 30,
                      width: 120,
                      child: Text('DSA Tech Team',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15,
                            fontFamily: 'LibreBaskerville-Italic'),),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    );
  }
}
