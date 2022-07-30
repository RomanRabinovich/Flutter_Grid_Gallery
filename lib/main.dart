import 'package:flutter/material.dart';
import 'package:flutter_gallery_grid/gallery_main_page.dart';

void main() => runApp(const PhotoGalleryApp());

class PhotoGalleryApp extends StatelessWidget {
  const PhotoGalleryApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Photo Gallery'),
        ),
        body: const GalleryMainPage(),
      ),
    );
  }
}
