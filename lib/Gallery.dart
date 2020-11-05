import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyGallery extends StatefulWidget {
  @override
  _MyGalleryState createState() => _MyGalleryState();
}

class _MyGalleryState extends State<MyGallery> {
  File imageFile;
  var picker = ImagePicker();

  Future openGallery() async {
    var picture = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      imageFile = File(picture.path);
    });
  }

  cancelpic() {
    setState(() {
      imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff885566),
        title: Text("Gallery"),
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
                        Icons.photo_library,
                        size: 50,
                      ),
                      onPressed: openGallery,
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
                  onPressed: cancelpic,
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
