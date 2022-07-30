import 'dart:convert';
import 'package:flutter_gallery_grid/gallery_secondary_page.dart';
import 'package:flutter_gallery_grid/main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class GalleryMainPage extends StatefulWidget {
  const GalleryMainPage({Key? key}) : super(key: key);
  @override
  State<GalleryMainPage> createState() => _GalleryMainPageState();
}

class _GalleryMainPageState extends State<GalleryMainPage> {
  bool loading = true;
  late List<String> ids;
  @override
  void initState() {
    loading = true;
    ids = [];
    _loadImageIds();
    super.initState();
  }

  void _loadImageIds() async {
    final response = await http.get(Uri.parse('https://picsum.photos/v2/list'));
    final json = jsonDecode(response.body);
    List<String> _ids = [];
    for (var image in json) {
      _ids.add(image['id']);
    }
    setState(() {
      loading = false;
      ids = _ids;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ImagePage(ids[index])),
          );
        },
        child: Image.network(
          'https://picsum.photos/id/${ids[index]}/300/300',
        ),
      ),
      itemCount: ids.length,
    );
  }
}
