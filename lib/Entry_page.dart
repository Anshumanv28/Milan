import 'package:Milan2/api_services.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:Milan2/failed.dart';
// import 'api_util.dart'; // Import the ApiUtil class
import 'dart:convert';
import 'package:Milan2/verified.dart';
class DataEntryPage extends StatefulWidget {
  final String? staffName;
  final String? staffId;

  const DataEntryPage({super.key, this.staffName, this.staffId});

  @override
  _DataEntryPageState createState() => _DataEntryPageState();
}

class _DataEntryPageState extends State<DataEntryPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController paymentIdController = TextEditingController();
  TextEditingController ticketIdController = TextEditingController();
  TextEditingController ticketTypeController = TextEditingController();
  TextEditingController serialNumberController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    print("🍀🍀🍀🍀🍀🍀🍀EntryPage");
    print(widget.staffId);
    print(widget.staffName);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Enter Details', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            FocusScope.of(context).unfocus();
            Future.delayed(Duration(milliseconds: 300), () {
              Navigator.pop(context);
            });
          },
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30),
              SizedBox(
                width: 310,
                height: 60,
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35),
              SizedBox(
                width: 310,
                height: 60,
                child: TextFormField(
                  controller: paymentIdController,
                  decoration: InputDecoration(
                    hintText: "Payment_ID",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 40),
              SizedBox(
                width: 310,
                height: 60,
                child: TextFormField(
                  controller: ticketIdController,
                  decoration: InputDecoration(
                    hintText: "Ticket_Id",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 310,
                height: 60,
                child: TextFormField(
                  controller: serialNumberController,
                  decoration: InputDecoration(
                    hintText: "Serial Number",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height:30),
              Container(
                width: 160,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(38),
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
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    print('Verifying details...');
                    setState(() {
                      isLoading = true;
                    });
                    // print('❤');
                    // Assume you have the necessary userId, paymentId, and ticketId
                    final email = emailController.text;
                    final paymentId = paymentIdController.text;
                    final ticketId = ticketIdController.text;
                    final ticketType = ticketTypeController.text;
                    final serialNumber = serialNumberController.text;

                    try {
                      final ApiResponse response =
                      await ApiService.submitDetails(context, email, paymentId, ticketId, serialNumber as int);
                      print(response.success);
                      if (response.success) {
                        print(response.success);
                        print("Details submitted successfully");
                        String responseBody = response.message;
                        Map<String, dynamic> responseJson = json.decode(responseBody);
                        // final data1 = responseJson
                        //❤️❤️📦📦🍀🍀💥💥❤️❤️📦📦🍀🍀💥💥❤️❤️📦📦🍀🍀💥💥❤️❤️🍀📦📦🍀🍀💥💥
                        // Navigate to the next page or perform desired actions
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VerifiedPage(message: responseJson,)),
                        );
                      } else {
                        print('Error: Submission failed.');
                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //   content: Text("Signup Failed. Please try again."),
                        // ));
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FailedPage(errorMessage: response.message)),
                        );
                      }
                    } catch (e) {
                      print('error: $e');
                      Navigator.push(
                        context,
                        // MaterialPageRoute(
                        //   builder: (context) => InfoPage(scannedData: data),
                        // ),
                        MaterialPageRoute(builder: (context) => FailedPage(errorMessage: e.toString())),
                      );
                    } finally {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: isLoading
                      ? Lottie.asset('assets/animations/Animation - 1704788076072.json',fit: BoxFit.contain,)
                      : Text(
                    "Verify",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
