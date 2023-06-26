import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/domain/post.dart';

class AccountModel {
  final Stream<QuerySnapshot<Post>> postsStream = FirebaseFirestore.instance
      .collection('posts')
      .where('userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
      .withConverter<Post>(
        fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
        toFirestore: (post, _) => post.toJson(),
      )
      .snapshots();

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }

  String getNickname() {
    return FirebaseAuth.instance.currentUser?.displayName ?? '이름 없음';
  }

  String getProfileImageUrl() {
    return FirebaseAuth.instance.currentUser?.photoURL ??
        'https://cdn.pixabay.com/photo/2023/06/03/17/11/giraffe-8038107_1280.jpg';
  }
}
