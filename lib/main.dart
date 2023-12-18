import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roadvision/screens/capturescreen.dart';
import 'package:roadvision/screens/splashsreen.dart';
import 'package:roadvision/screens/startingpage.dart';
import 'package:roadvision/screens/usercurrentlocation.dart';

import 'firebase_options.dart';


//global object for accessing device screen size
late Size mq;

void main() {
  _initializeFirebase();
  WidgetsFlutterBinding.ensureInitialized();
  //for fullscreen in splashscreen
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
//for setting orientation to portrait only
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) {
    runApp(const MyApp());
  });

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

_initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}