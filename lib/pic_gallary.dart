import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Gallary extends StatefulWidget {
  const Gallary({Key? key}) : super(key: key);

  @override
  State<Gallary> createState() => _GallaryState();
}

class _GallaryState extends State<Gallary> {
  File? _imagefile;
  File? _image = null;

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: size.height * 0.1),
        child: Column(
          children: [
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                clearimage();
              },
            ),
            ElevatedButton(
              onPressed: () {
                _pickFromGallery();
              },
              child: Text('Select OneImages'),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              height: size.height * 0.15,
              width: size.width * 0.3,
              color: Colors.blueAccent,
              child: _imagefile == null
                  ? new Text('No image selected.')
                  : new Image.file(_imagefile!),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            ElevatedButton(
              onPressed: () {
                selectImages();
              },
              child: Text('Select MultiImages '),
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: imageFileList!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 5.0, crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Stack(
                        children: [
                          Image.file(
                            File(imageFileList![index].path),
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            right: 3.0,
                            child: InkWell(
                              child: Icon(
                                Icons.remove_circle,
                                size: 30,
                                color: Colors.red,
                              ),
                              onTap: () {
                                setState(
                                  () {
                                    imageFileList?.removeAt(index);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  clearimage() {
    setState(() {
      _imagefile = null;
    });
  }

  _pickFromGallery() async {
    PickedFile? image = await ImagePicker.platform
        .pickImage(source: ImageSource.gallery, imageQuality: 100);
    setState(() {
      _imagefile = File(image!.path);
    });
  }
}
