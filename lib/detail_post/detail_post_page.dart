import 'package:flutter/material.dart';
import 'package:instagram_clone/detail_post/detail_post_page_model.dart';
import 'package:instagram_clone/domain/post.dart';

class DetailPostPage extends StatelessWidget {
  final Post post;
  final model = DetailPostModel();
  DetailPostPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('둘러보기'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(model.getProfileImageUrl()),
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.getEmail(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(model.getNickname()),
                  ],
                ),
              ],
            ),
          ),
          Hero(
            tag: post.id,
            child: Image.network(post.imageUrl),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(post.title),
          ),
        ],
      ),
    );
  }
}
