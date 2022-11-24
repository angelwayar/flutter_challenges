class Post {
  final String authorName;
  final String authorImageUrl;
  final String timeAgo;
  final String imageUrl;

  Post({
    required this.authorName,
    required this.authorImageUrl,
    required this.timeAgo,
    required this.imageUrl,
  });
}

final List<Post> posts = [
  Post(
    authorName: 'Sam Martin',
    authorImageUrl: 'assets/instagram/images/user0.png',
    timeAgo: '5 min',
    imageUrl: 'assets/instagram/images/post0.jpg',
  ),
  Post(
    authorName: 'Sam Martin',
    authorImageUrl: 'assets/instagram/images/user0.png',
    timeAgo: '10 min',
    imageUrl: 'assets/instagram/images/post1.jpg',
  ),
];

final List<String> stories = [
  'assets/instagram/images/user1.png',
  'assets/instagram/images/user2.png',
  'assets/instagram/images/user3.png',
  'assets/instagram/images/user4.png',
  'assets/instagram/images/user0.png',
  'assets/instagram/images/user1.png',
  'assets/instagram/images/user2.png',
  'assets/instagram/images/user3.png',
];
