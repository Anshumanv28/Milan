import 'dart:convert';
import 'package:Milan2/api_services.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'api_util.dart';
import 'package:Milan2/selection_page.dart';
import 'package:Milan2/verified.dart';
import 'package:Milan2/failed.dart';

class ScannerPage extends StatefulWidget {
  // final String? staffName;
  // final String? staffId;
  // const ScannerPage({Key? key, this.staffName, this.staffId}) : super(key: key);

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> with AutomaticKeepAliveClientMixin {
  bool isLoading = false;
  @override
  bool get wantKeepAlive => true;
  bool isPaused = false;
  MobileScannerController cameraController = MobileScannerController();
  var data = '';
  bool isScanned = false;

  @override
  void initState() {
    super.initState();
    _checkCameraPermission();
    _resetScanner();
    print("reset Scanner called 🍀🍀🍀🍀🍀🍀🍀🍀🍀");
    if (!isPaused) {
      _startCamera(); // Start camera if not paused
    }
  }

  void _checkCameraPermission() async {
    await Permission.camera.request();
  }

  void _startCamera() {
    cameraController.start();
  }

  void _pauseCamera() {
    cameraController.stop();
  }

  // Method to reset the scanning state
  void _resetScanner() {
    setState(() {
      isScanned = false;
    });
    _startCamera();
  }

  @override
  Widget build(BuildContext context) {
    print("🍀🍀🍀🍀🍀🍀🍀ScannerPage");
    // print(widget.staffId);
    // print(widget.staffName);

    super.build(context); // To maintain the state when switching tabs

    return WillPopScope(
      onWillPop: () async {
        // Pause the camera before navigating back
        _pauseCamera();
        setState(() {
          isPaused = true;
        });
        return true; // Allow back navigation
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Scan QR', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectionPage(),
                ),
              ).then((_) {
                // Reset the isScanned flag when returning from InfoPage
                _resetScanner();
              });// Navigate back when the back button is pressed
            },
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 30.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              height: MediaQuery.of(context).size.width * 0.8, // Adjust the height to increase the size
              width: MediaQuery.of(context).size.width * 0.8, // Adjust the width to increase the size
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                border: Border.all(color: Colors.black),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 3.5,
                    blurRadius: 1.5,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  ValueListenableBuilder<double>(
                    valueListenable: cameraController.zoomScaleState,
                    builder: (context, zoomScale, _) {
                      final double adjustedZoomScale = zoomScale * 0.8; // Set zoom scale to 80% of the current value (adjust as needed)
                      // Set the zoom scale using setZoomScale
                      cameraController.setZoomScale(adjustedZoomScale);
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(19.0),
                        child: MobileScanner(
                          controller: cameraController,
                          onDetect: (capture) => _onBarcodeDetected(context, capture),
                        ),
                      );
                    },
                  ),
                  if (isLoading)
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            ),

            SizedBox(height: 40.0),
            //place arrow icon here
            Column(
              children: [
                Image.asset('assets/icons/icons8-up-arrow-64.png', width: 40, height: 40),
                SizedBox(height: 10),
                Container(
                  width: 150,
                  height: 60,
                  child: isLoading
                      ? Lottie.asset('assets/animations/Animation - 1704788076072.json',fit: BoxFit.contain,)
                      : Text(
                    " Place The QR           inside the BOX",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Visibility(
                  visible: isLoading,
                  child: Container(
                    height: 30,
                    width: 120,
                    child: Text("  Verifying...",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    color: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35), // Adjust the border radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey.withOpacity(1),
                              spreadRadius: 2.5,
                              blurRadius: 2.5,
                              offset: Offset(-1, 1.5),
                            ),
                          ],
                        ),
                        child: OutlinedButton(
                          onPressed: () =>  cameraController.toggleTorch(),
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: CircleBorder(),
                              padding: EdgeInsets.only(left: 2)
                          ),
                          child:  Icon(
                            cameraController.torchState.value == TorchState.off
                                ? Icons.flash_on
                                : Icons.flash_off,
                            color: Colors.deepPurple,
                            size: 35,
                          ),
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35), // Adjust the border radius
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey.withOpacity(1),
                              spreadRadius: 2.5,
                              blurRadius: 2.5,
                              offset: Offset(0, 1.5),
                            ),
                          ],
                        ),
                        child: OutlinedButton(
                          onPressed: () => cameraController.switchCamera(),
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: CircleBorder(),
                              padding: EdgeInsets.only(left: 2)
                          ),
                          child:  Icon(
                            Icons.flip_camera_android,
                            color: Colors.deepPurple,
                            size: 35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onBarcodeDetected(BuildContext context, BarcodeCapture capture) async {
    if (!isScanned) {
      setState(() {
        isLoading = true;
      });
      final List<Barcode> barcodes = capture.barcodes;
      // final Uint8List? image = capture.image;
      debugPrint('Barcodes 📦📦📦📦 $barcodes');
      for (final barcode in barcodes) {
        data = barcode.rawValue!;
        debugPrint('Barcode found!💥💥💥💥 $data');
        debugPrint('Barcode 💥💥📦📦 $barcode');
        isScanned = true;
      }
      print('Verifying details...');
      try {
        Map<String, dynamic> jsonData = json.decode(data);
        final email = jsonData["Email"];
        final paymentId = jsonData['Payment_Id'];
        final ticketId = jsonData['Ticket_Id'];
        final serialNumber = jsonData['Serial_Number'];
        final ticketType = jsonData['Ticket_Type'];
        // final ticketType = jsonData['Ticket_Type'];
        // final serialNumber = jsonData['Serial_number'];
        // print('debug debug debug debug debug debug debug debug debug debug debug debug debug debug debug debug debug debug');
        final ApiResponse response = await ApiService.submitDetails(
          context,
          email,
          paymentId,
          ticketId,
          serialNumber
          // ticketType,
          // widget.staffName,
          // widget.staffId,
        );

        if (response.success) {
          print("Details submitted successfully");
          String responseBody = response.message;
          Map<String, dynamic> responseJson = json.decode(responseBody);
          // Navigate to the next page or perform desired actions
          navigateToVerifiedPage(context, responseJson);
        } else {
          print('Error: Submission failed.');
          navigateToFailedPage(context, response.message);
        }
      } catch (e) {
        print('error: $e');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FailedPage(errorMessage: 'Wrong QR!'),
          ),
        ).then((_) {
          // Reset the isScanned flag when returning from InfoPage
          _resetScanner();
        });
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void navigateToVerifiedPage(BuildContext context, Map<String, dynamic> message) {
    print('⛔⛔⛔⛔⛔⛔⛔⛔⛔⛔⛔⛔⛔⛔');
    _pauseCamera(); // Pause the camera before navigating
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VerifiedPage(message: message),
      ),
    ).then((_) {
      setState(() {
        isPaused = true; // Update paused state flag
      });
      _resetScanner();
    });
  }

  void navigateToFailedPage(BuildContext context, String errorMessage) {
    _pauseCamera(); // Pause the camera before navigating
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FailedPage(errorMessage: errorMessage),
      ),
    ).then((_) {
      setState(() {
        isPaused = true; // Update paused state flag
      });
      _resetScanner();
    });
  }

  void dispose() {
    if (!isPaused) {
      _pauseCamera(); // Pause camera if not already paused
    }
    cameraController.dispose();
    super.dispose();
  }
}
