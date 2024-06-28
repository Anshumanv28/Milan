import 'scanner_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'selection_page.dart';

class FailedPage extends StatelessWidget {
  final String errorMessage;


  FailedPage({required this.errorMessage});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Verification Failed', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SelectionPage(),),);
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.red, // You can customize the color
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Container(
                width: 200,
                height: 200,
                child: Lottie.asset(
                  'assets/animations/Animation - 1704788000565.json', // Replace with your Lottie animation file
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Verification Failed! ⛔',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 80,),
              Text(
                'Why did this happen?🤔(Tech Team)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 10,),
              Container(
                height: 50,
                width: 350,
                child: Center(
                  child: Text(
                    errorMessage,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 80),
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
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SelectionPage()),
                        ModalRoute.withName('/SelectionPage'),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text(
                    "Done",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              // Container(
              //   width: 160,
              //   height: 80,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(38), // Adjust the border radius
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black.withOpacity(0.4),
              //         spreadRadius: 1.5,
              //         blurRadius: 1.5,
              //         offset: Offset(-1, 1.5),
              //       ),
              //     ],
              //   ),
              //   child: OutlinedButton(
              //     onPressed: (){
              //       Navigator.pushAndRemoveUntil(
              //         context,
              //         MaterialPageRoute(builder: (context) => ScannerPage()),
              //         ModalRoute.withName('/ScannerPage'),);
              //     },
              //     style: ButtonStyle(
              //       backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              //     ),
              //     child: Text(
              //       "Next",
              //       style: TextStyle(
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
