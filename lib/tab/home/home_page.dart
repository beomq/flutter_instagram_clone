import 'package:flutter/material.dart';

import 'home_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final model = HomeModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'instagram clone',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'instagram 에 오신걸 환영 합니다',
              style: TextStyle(fontSize: 26),
            ),
            const Text(
              '사진과 동영상을 보려면 팔로우하세요',
            ),
            Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: GestureDetector(
                        onTap: () async {
                          await model.updateProfileImage();

                          setState(() {});
                        },
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(model.getProfileImageUrl()),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      model.getEmail(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      model.getNickname(),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://cdn.pixabay.com/photo/2018/04/23/14/23/giraffe-3344366_1280.jpg',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Image.network(
                          'https://cdn.pixabay.com/photo/2013/07/19/00/18/giraffe-165200_1280.jpg',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Image.network(
                          'https://cdn.pixabay.com/photo/2019/09/17/20/47/prague-4484517_1280.jpg',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text('Facebook 친구'),
                    const SizedBox(
                      height: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('팔로우'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
