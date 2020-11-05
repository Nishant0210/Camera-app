import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
