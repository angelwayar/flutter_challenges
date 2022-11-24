import 'package:flutter/material.dart';
import '../models/post.dart';
import '../widgets/picture.dart';
import '../widgets/comments.dart';

class ViewPostPage extends StatelessWidget {
  final Post post;

  const ViewPostPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            PictureWidget(post: post, backButton: true),
            const SizedBox(height: 24.0),
            const Expanded(child: CommentsWidget())
          ],
        ),
      ),
    );
  }
}
