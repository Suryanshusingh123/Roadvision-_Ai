import 'package:flutter/material.dart';
import 'package:roadvision/screens/capturescreen.dart';
import 'package:roadvision/screens/usercurrentlocation.dart';

import '../main.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({super.key});

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade700,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 140, 0, 0),
            child: Text(
              'ROADVISION AI',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Center(
            child: Image.asset(
              'images/logo.jpg', // Replace with the path to your image
              width: 180.0, // Set the width as needed
              height: 180.0, // Set the height as needed
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            '© 2023 Indika AI',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              // letterSpacing: 2,
              color: Colors.white,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Capture road condition and\n    distress data right from\n         your smartphone',
              style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
                // letterSpacing: 2,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 60),
            child: Row(
              children: [
                Icon(
                  Icons.video_camera_back, // Replace with the desired icon
                  // size: 48.0, // Adjust the size of the icon
                  color: Colors.white, // Adjust the color of the icon
                ),
                Text(
                  ' Capture',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    // letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.more_vert, // Replace with the desired icon
                  color: Colors.white, // Adjust the color of the icon
                ),
                Icon(
                  Icons.receipt_rounded, // Replace with the desired icon
                  //  size: 48.0, // Adjust the size of the icon
                  color: Colors.white, // Adjust the color of the icon
                ),
                Text(
                  ' Review',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    // letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.more_vert, // Replace with the desired icon
                  color: Colors.white, // Adjust the color of the icon
                ),
                Icon(
                  Icons.cloud_upload_outlined, // Replace with the desired icon
                  // size: 48.0, // Adjust the size of the icon
                  color: Colors.white, // Adjust the color of the icon
                ),
                Text(
                  '  Upload',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    // letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 80,),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => const CurrentLocationScreen()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // Background color
                  onPrimary: Colors.black, // Text color
                  //padding: EdgeInsets.all(16.0), // Button padding
                  textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold), // Text style
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('               Get Started'),
                    SizedBox(width: 50,),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
