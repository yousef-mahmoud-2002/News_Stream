class ArticleModel {
  final String? image;
  final String title;
  final String? subtitle;
  final String? url;
  final String? source;

  ArticleModel({
    required this.url,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.source,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      image: json['image'],
      title: json['title'],
      subtitle: json['description'],
      url: json['url'],
      source: json['source'],
    );
  }

  factory ArticleModel.dummy() => ArticleModel(
        image: 'https://dummyimage.com/600x400/000/fff',
        title: 'Title',
        subtitle: 'Subtitle',
        url: 'https://google.com',
        source: 'Source',
      );
}
