import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  final String id;
  ImagePage(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(
          'https://picsum.photos/id/$id/600/600',
        ),
      ),
    );
  }
}
