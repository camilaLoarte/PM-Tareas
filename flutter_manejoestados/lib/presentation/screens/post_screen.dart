import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/post_provider.dart';
import '../widgets/shimmer_list.dart';
import '../widgets/error_view.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (_, provider, __) {
        switch (provider.state) {
          case PostState.loading:
            return ShimmerList();

          case PostState.success:
            return ListView.builder(
              itemCount: provider.posts.length,
              itemBuilder: (_, index) {
                final post = provider.posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            );

          case PostState.empty:
            return const Center(
              child: Text('No hay datos'),
            );

          case PostState.error:
            return ErrorView(
              onRetry: provider.fetchPosts,
            );
        }
      },
    );
  }
}
