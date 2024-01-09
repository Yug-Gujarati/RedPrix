import 'package:flutter/material.dart';

class User {
  String? id;
  String? name;
  String? profilePhoto;
  String? profilePhotoThumb;
  String? email;
  String? userTypeText;
  String? statusText;
  String? isSubscribed;
  String? followersCount;
  String? followingsCount;
  String? relation;

  User({
    this.id,
    this.name,
    this.profilePhoto,
    this.profilePhotoThumb,
    this.email,
    this.userTypeText,
    this.statusText,
    this.isSubscribed,
    this.followersCount,
    this.followingsCount,
    this.relation,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      profilePhoto: json['profile_photo'],
      profilePhotoThumb: json['profile_photo_thumb'],
      email: json['email'],
      userTypeText: json['user_type_text'],
      statusText: json['status_text'],
      isSubscribed: json['is_subscribed'],
      followersCount: json['followers_count'],
      followingsCount: json['followings_count'],
      relation: json['relation'],
    );
  }
}

class Likes {
  String? userId;
  User user;
  String? postId;
  Post post;
  String? state;
  String? city;

  Likes({
    this.userId,
    required this.user,
    this.postId,
    required this.post,
    this.state,
    this.city,
  });

  factory Likes.fromJson(Map<String, dynamic> json) {
    return Likes(
      userId: json['user_id'],
      user: User.fromJson(json['user']),
      postId: json['post_id'],
      post: Post.fromJson(json['post']),
      state: json['state'],
      city: json['city'],
    );
  }
}

class Images {
  String? id;
  String? postId;
  String? image;
  String? status;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;

  Images({
    this.id,
    this.postId,
    this.image,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      id: json['id'],
      postId: json['post_id'],
      image: json['image'],
      status: json['status'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}


class Post {
  String? id;
  String? userId;
  String? title;
  String? description;
  String? status;
  String? statusText;
  String? url;
  String? isLiked;
  List<Likes> likes;
  String? createdAt;
  User user;
  List<Images> images;
  String? likesCount;
  String? commentsCount;
  String? sharesCount;
  String? viewsCount;
  List<Null>? tags;
  List<Null>? mentions;

  Post({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.status,
    this.statusText,
    this.url,
    this.isLiked,
    required this.likes,
    this.createdAt,
    required this.user,
    required this.images,
    this.likesCount,
    this.commentsCount,
    this.sharesCount,
    this.viewsCount,
    required this.tags,
    required this.mentions,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
      statusText: json['status_text'],
      url: json['url'],
      isLiked: json['is_liked'],
      likes: List<Likes>.from(
        (json['likes'] as List<dynamic>).map((like) => Likes.fromJson(like)),
      ),
      createdAt: json['created_at'],
      user: User.fromJson(json['user']),
      images: List<Images>.from(
        (json['images'] as List<dynamic>).map((image) => Images.fromJson(image)),
      ),
      likesCount: json['likes_count'],
      commentsCount: json['comments_count'],
      sharesCount: json['shares_count'],
      viewsCount: json['views_count'],
      tags: json['tags'],
      mentions: json['mentions'],
    );
  }
}

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(post.user.profilePhoto ??''),
            ),
           title: Text(post.user.name ?? ''),
          ),
          Image.network(post.images.isNotEmpty ? post.images[0].image ?? '' : ''),
          Image.network(post.images as String),
           Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(Icons.thumb_up),
                SizedBox(width: 4),
                Text(post.likesCount ?? ''),
              ],
            ),
          ),

        ],
      ),
    );
  }
}