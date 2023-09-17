import 'package:flutter/material.dart';
import 'package:opencamera/pic_camera.dart';
import 'package:opencamera/pic_gallary.dart';

import 'addVideo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera role"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => camera(title: '',)),
                );
              },
              child: Text("pic image for camera"),
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange,
                  side: BorderSide(width: 5, color: Colors.yellow)),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Gallary() ),
                );
              },
              child: Text("pic image for Gallary"),
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange,
                  side: BorderSide(width: 5, color: Colors.yellow)),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Video() ),
                );
              },
              child: Text("Add Video"),
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange,
                  side: BorderSide(width: 5, color: Colors.yellow)),
            ),
          ],
        ),
      ),
    );
  }
}
