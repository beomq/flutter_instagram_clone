import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/create/create_page.dart';
import 'package:instagram_clone/detail_post/detail_post_page.dart';
import 'package:instagram_clone/domain/post.dart';
import 'package:instagram_clone/tab/search/search_model.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = SearchModel();

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
      body: StreamBuilder<QuerySnapshot<Post>>(
          stream: model.postsStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('알 수 없는 에러');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            List<Post> posts =
                snapshot.data!.docs.map((post) => post.data()).toList();

            return GridView.builder(
              itemCount: posts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                final post = posts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPostPage(post: post),
                      ),
                    );
                  },
                  child: Hero(
                    tag: post.id,
                    child: Image.network(
                      post.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
