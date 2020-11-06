import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FlutterTts flutterTts = FlutterTts();
  var text = "Please choose an image";

  Future speak(String text) async {
    if (text != null && text.isNotEmpty) {
      await flutterTts.setLanguage("en-IN");
      await flutterTts.setSpeechRate(1.0);
      await flutterTts.setVolume(1.0);
      await flutterTts.setPitch(1.0);
      await flutterTts.speak(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff885566),
        title: Text("Image"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 50,
                child: RaisedButton.icon(
                  color: Colors.black38,
                  onPressed: () {
                    Navigator.pushNamed(context, "Gallery");
                    speak(text);
                  },
                  label: Text(
                    "Gallery",
                  ),
                  icon: Icon(
                    Icons.image,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 150,
                height: 50,
                child: RaisedButton.icon(
                  color: Colors.black38,
                  onPressed: () {
                    Navigator.pushNamed(context, "Camera");
                    speak(text);
                  },
                  label: Text(
                    "Camera",
                  ),
                  icon: Icon(
                    Icons.camera,
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
