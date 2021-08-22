class EventModel {
  int id;
  String name;
  String subtitle;
  String imageFeatured;
  String resume;
  String dateStart;
  String description;
  String createdAt;
  String updatedAt;

  EventModel(
      { required this.id,
      required this.name,
      required this.subtitle,
      required this.imageFeatured,
      required this.resume,
      required this.dateStart,
      required this.description,
      required this.createdAt,
      required this.updatedAt,
  });

  EventModel.fromJson(Map<String, dynamic> json):
    id = json['id'] ?? json['id'],
    name = json['name'] ?? json['name'],
    subtitle = json['subtitle'] ?? json['subtitle'],
    resume = json['resume'] ?? json['resume'],
    imageFeatured = json['image_featured'] ?? json['image_featured'],
    description = json['description'] ?? json['description'],
    dateStart = json['date_start'] ?? json['date_start'],
    createdAt = json['created_at'] ?? json['created_at'],
    updatedAt = json['updated_at'] ?? json['updated_at'];

}