import 'package:flutter/material.dart';
import 'package:instagram_clone/create/create_page.dart';

class SearchPage extends StatelessWidget {
  final List<String> _urls = const [
    'https://cdn.pixabay.com/photo/2018/04/23/14/23/giraffe-3344366_1280.jpg',
    'https://cdn.pixabay.com/photo/2013/07/19/00/18/giraffe-165200_1280.jpg',
    'https://cdn.pixabay.com/photo/2019/09/17/20/47/prague-4484517_1280.jpg',
    'https://cdn.pixabay.com/photo/2019/09/17/20/47/prague-4484517_1280.jpg',
  ];
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreatePage()),
          );
        },
        child: const Icon(Icons.create),
      ),
      appBar: AppBar(
        title: const Text('instagram clone'),
      ),
      body: GridView.builder(
        itemCount: _urls.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          final url = _urls[index];
          return Image.network(
            url,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
