import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  final String scannedData;

  const InfoPage({Key? key, required this.scannedData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Scanned Information:',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            scannedData,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Perform verification logic here
              print('Verification logic');
            },
            child: Text('Verify'),
          ),
        ],
      ),
    );
  }
}
