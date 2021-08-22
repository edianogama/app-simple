
import 'package:flutter_app/app/data/model/user/user_model.dart';

class Auth {
  User? user;
  String token;
  String? tokenType;
  int? expiresIn;

  Auth({this.user, required this.token, required this.tokenType, required this.expiresIn});

  Auth.fromJson(Map<String, dynamic> json):
    user = json['user'] != null ? User.fromJson(json['user']) : json['user'],
    token = json['token'] ?? json['token'],
    tokenType = json['tokenType'] ?? json['tokenType'],
    expiresIn = json['expiresIn'] ?? json['expiresIn'];

}