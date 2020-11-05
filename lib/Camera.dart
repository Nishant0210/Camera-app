import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyCamera extends StatefulWidget {
  @override
  _MyCameraState createState() => _MyCameraState();
}

class _MyCameraState extends State<MyCamera> {
  File imageFile;
  var picker = ImagePicker();

  Future openCamera() async {
    var picture = await picker.getImage(source: ImageSource.camera);
    setState(() {
      imageFile = File(picture.path);
    });
  }

  cancel() {
    setState(() {
      imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff885566),
        title: Text("Camera"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width * 0.8,
              child: imageFile == null
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'No image selected.',
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(
                            Icons.photo,
                            size: 200,
                            color: Colors.black26,
                          )
                        ],
                      ),
                    )
                  : Image.file(imageFile),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 80,
                    height: 70,
                    child: RaisedButton(
                      child: Icon(
                        Icons.add_a_photo,
                        size: 40,
                      ),
                      onPressed: openCamera,
                    )),
                SizedBox(
                  width: 10,
                ),
                Container(
                    child: FloatingActionButton.extended(
                  icon: Icon(
                    Icons.cancel,
                    size: 30,
                  ),
                  onPressed: cancel,
                  label: Text("cancel"),
                  backgroundColor: Colors.pink,
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
