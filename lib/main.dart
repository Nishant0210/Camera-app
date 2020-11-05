import 'package:camera_app/Camera.dart';
import 'package:camera_app/Gallery.dart';

import 'package:camera_app/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "Home",
      routes: {
        "Home": (context) => SplashScreen(),
        "Gallery": (context) => MyGallery(),
        "Camera": (context) => MyCamera(),
      },
    ),
  );
}
