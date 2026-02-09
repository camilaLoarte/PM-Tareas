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

  try {
    final result = await service.getPosts();

    // 🔒 FORZAR SUCCESS
    posts = result;
    state = PostState.success;
  } catch (e) {
    state = PostState.error;
    errorMessage = 'Error de red';
  }

  notifyListeners();
  }
}
