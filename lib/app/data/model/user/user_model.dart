class User {
  int id;
  String username;
  String createdAt;
  String updatedAt;

  User(
      {required this.id,
      required this.username,
      required this.createdAt,
      required this.updatedAt});

  @override
  String toString() => 'User { name: $username}';
  
  User.fromJson(Map<String, dynamic> json):
    id = json['id'] ?? json['id'],
    username = json['username'] ?? json['username'],
    createdAt = json['created_at'] ?? json['created_at'],
    updatedAt = json['updated_at'] ?? json['updated_at'];

}