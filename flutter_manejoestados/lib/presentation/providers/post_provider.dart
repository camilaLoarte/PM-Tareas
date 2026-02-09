import 'package:flutter/material.dart';
import '../../data/models/post_model.dart';
import '../../data/services/post_service.dart';

enum PostState {
  loading,
  success,
  empty,
  error,
}

class PostProvider extends ChangeNotifier {
  final PostService service;

  PostProvider(this.service);

  PostState state = PostState.loading;
  List<PostModel> posts = [];
  String errorMessage = '';

  Future<void> fetchPosts() async {
    state = PostState.loading;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    // 🔒 FORZAR EMPTY
    posts = [];
    state = PostState.empty;

    notifyListeners();
  }
}
