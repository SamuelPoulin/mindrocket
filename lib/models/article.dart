class Article {
  final String title;
  final String imageUrl;
  final String newsSite;
  final String summary;

  Article(
    this.title,
    this.imageUrl,
    this.newsSite,
    this.summary,
  );

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      json['title'],
      json['imageUrl'],
      json['newsSite'],
      json['summary'],
    );
  }
}
