import 'package:flutter/material.dart';
import 'package:flutter_challenges/challenges/instagram_redesign/models/comment.dart';

class CommentsWidget extends StatelessWidget {
  const CommentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(0, 5),
            blurRadius: 8.0,
          )
        ],
      ),
      child: ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  comments[index].authorImageUrl,
                  height: 60.0,
                  width: 60.0,
                ),
              ),
            ),
            title: Text(
              comments[index].authorName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(comments[index].text),
            trailing: IconButton(
              icon: const Icon(Icons.favorite_border_outlined),
              color: Colors.grey,
              onPressed: () => debugPrint('Favorite'),
            ),
          );
        },
      ),
    );
  }
}
