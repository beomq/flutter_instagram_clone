import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/detail_post/detail_post_page.dart';
import 'package:instagram_clone/domain/post.dart';
import 'package:instagram_clone/tab/account/account_model.dart';

class AccountPage extends StatelessWidget {
  final model = AccountModel();
  AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('instagram clone'),
        actions: [
          IconButton(
            onPressed: () {
              model.logout();
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(model.getProfileImageUrl()),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          alignment: Alignment.bottomRight,
                          child: const Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 28,
                                height: 28,
                                child: FloatingActionButton(
                                    onPressed: null,
                                    backgroundColor: Colors.white),
                              ),
                              SizedBox(
                                width: 25,
                                height: 25,
                                child: FloatingActionButton(
                                  onPressed: null,
                                  child: Icon(Icons.add_circle),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      model.getNickname(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  children: [
                    StreamBuilder<QuerySnapshot<Post>>(
                        stream: model.postsStream,
                        builder: (context, snapshot) {
                          int count = 0;

                          if (snapshot.hasData) {
                            count = snapshot.data!.size;
                          }
                          return Text(
                            '$count',
                            style: const TextStyle(fontSize: 18),
                          );
                        }),
                    const Text(
                      '게시물',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const Column(
                  children: [
                    Text(
                      '0',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '팔로잉',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const Column(
                  children: [
                    Text(
                      '0',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '팔로워',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot<Post>>(
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

                  return Expanded(
                    child: GridView.builder(
                      itemCount: posts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                                builder: (context) =>
                                    DetailPostPage(post: post),
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
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
