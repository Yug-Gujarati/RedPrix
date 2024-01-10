// post_model.dart

class Post {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String userName;
  final String userProfilePhoto;
  final String likesCount;
  final String commentsCount;
  final String createdAt;
  final String sharCount;

  Post({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.userName,
    required this.userProfilePhoto,
    required this.likesCount,
    required this.commentsCount,
    required this.createdAt,
    required this.sharCount,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    final user = json['user'];
    final images = json['images'] as List<dynamic>;
    

    return Post(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: images.isNotEmpty ? images[0]['image'] : '',
      userName: user['name'],
      userProfilePhoto: user['profile_photo'] ?? '',
      likesCount: json['likes_count'],
      sharCount: json['shares_count'],
      commentsCount: json['comments_count'],
      createdAt: json['created_at'],
    );
  }
}
