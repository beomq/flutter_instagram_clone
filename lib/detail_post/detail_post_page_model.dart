import 'package:firebase_auth/firebase_auth.dart';

class DetailPostModel {
  String getEmail() {
    return FirebaseAuth.instance.currentUser?.email ?? '메일 없음';
  }

  String getNickname() {
    return FirebaseAuth.instance.currentUser?.displayName ?? '이름 없음';
  }

  String getProfileImageUrl() {
    return FirebaseAuth.instance.currentUser?.photoURL ??
        'https://cdn.pixabay.com/photo/2023/06/03/17/11/giraffe-8038107_1280.jpg';
  }
}
