class Post {
  final int id;
  final int creator;
  final String title;
  final String content;
  final String createdAt;
  final int likes;
  final int dislikes;

  Post({
    required this.id,
    required this.creator,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.likes,
    required this.dislikes,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      creator: json['creator'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      createdAt: json['created_at'] as String,
      likes: json['likes'] as int,
      dislikes: json['dislikes'] as int,
    );
  }
}
