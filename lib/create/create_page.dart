import 'package:flutter/material.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('새 게시물'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  filled: true,
                  hintText: '제목을 입력하세요',
                  hintStyle: TextStyle(
                    color: Colors.grey[800],
                  ),
                  fillColor: Colors.white70,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('이미지 선택'),
              ),
              Image.network(
                'https://cdn.pixabay.com/photo/2013/07/19/00/18/giraffe-165200_1280.jpg',
                width: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
