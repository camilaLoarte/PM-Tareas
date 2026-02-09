import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/dio_client.dart';
import 'data/services/post_service.dart';
import 'presentation/providers/post_provider.dart';
import 'presentation/screens/post_screen.dart';

void main() {
  final dio = DioClient.getDio();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PostProvider>(
          create: (_) => PostProvider(
            PostService(dio),
          )..fetchPosts(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PostScreen(),
    );
  }
}
