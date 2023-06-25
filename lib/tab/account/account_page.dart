import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('instagram clone'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    const SizedBox(
                      width: 80,
                      height: 80,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://cdn.pixabay.com/photo/2023/06/03/17/11/giraffe-8038107_1280.jpg'),
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
                                onPressed: null, backgroundColor: Colors.white),
                          ),
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: FloatingActionButton(
                                onPressed: null, child: Icon(Icons.add_circle)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const Text(
                  'giraffe',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Column(
              children: [
                Text(
                  '3',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
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
      ),
    );
  }
}
