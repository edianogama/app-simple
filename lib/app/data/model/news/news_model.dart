class News {
  int id;
  String title;
  String subtitle;
  String imageFeatured;
  String description;
  String createdAt;
  String updatedAt;

  News(
      {required this.title,
      required this.id,
      required this.subtitle,
      required this.imageFeatured,
      required this.description,
      required this.createdAt,
      required this.updatedAt,
      });

  News.fromJson(Map<String, dynamic> json):
    id = json['id'] ?? json['id'],
    title = json['title'] ?? json['title'],
    subtitle = json['subtitle'] ?? json['subtitle'],
    imageFeatured = json['image_featured'] ?? json['image_featured'],
    description = json['description'] ?? json['description'],
    createdAt = json['created_at'] ?? json['created_at'],
    updatedAt = json['updated_at'] ?? json['updated_at'];

}