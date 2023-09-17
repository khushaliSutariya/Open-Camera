
import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';


class camera extends StatefulWidget {
  const camera({Key? key, required this.title}) : super(key: key);
  final String title;


  @override
  State<camera> createState() => _cameraState();
}

class _cameraState extends State<camera> {
  final photos = [];
  List<XFile>? _imageFileList;
  void openCamera() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => CameraCamera(
              onFile: (file) {
                photos.add(file);
                Navigator.pop(context);
                setState(() {});
              },
            )));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: photos.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: size.width,
            child: Image.file(photos[index],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openCamera,
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
