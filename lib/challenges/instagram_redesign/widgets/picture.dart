import 'package:flutter/material.dart';
import '../models/post.dart';
import '../pages/view_post.dart';

class PictureWidget extends StatelessWidget {
  final Post post;
  final bool backButton;

  const PictureWidget({super.key, required this.post, this.backButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 560.0,
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0.0),
            leading: SizedBox(
              width: backButton ? 140.0 : 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (backButton) ...[
                    IconButton(
                      padding: const EdgeInsets.all(0.0),
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 34.0),
                  ],
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        post.authorImageUrl,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            title: Text(
              post.authorName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(post.timeAgo),
            trailing: IconButton(
              icon: const Icon(Icons.more_horiz),
              color: Colors.black,
              onPressed: () => debugPrint('More'),
            ),
          ),
          Container(
            height: 400.0,
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: Image.asset(
                post.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => debugPrint('Like post'),
                      iconSize: 30.0,
                      icon: const Icon(Icons.favorite_border),
                    ),
                    const Text(
                      '2,515',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    if (!backButton) ...[
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ViewPostPage(
                                post: post,
                              ),
                            ),
                          );
                        },
                        iconSize: 30.0,
                        icon: const Icon(Icons.chat),
                      ),
                      const Text(
                        '350',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ],
                ),
                IconButton(
                  onPressed: () => debugPrint('Save post'),
                  icon: const Icon(Icons.bookmark_border),
                  iconSize: 30.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
