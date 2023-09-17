import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  File? _video;
  late  var _videoPlayerController;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _pickVideo();
            },
            child: Text('Select OneImages'),
          ),
          Container(
            height: size.height * 0.15,
            width: size.width * 0.3,
            color: Colors.blueAccent,
            child: _video == null
                ? new Text('No image selected.')
                : new Image.file(_video!),
          ),
        ],
      ),

    );
  }
  _pickVideo() async {
    PickedFile? pickedFile = await ImagePicker.platform.pickVideo(source: ImageSource.gallery);
    _video = File(pickedFile!.path);
    _videoPlayerController = VideoPlayerController.file(_video!)..initialize().then((_) {
      setState(() { });
      _videoPlayerController.play();
      _video = File(pickedFile.path);
    });
  }

}
