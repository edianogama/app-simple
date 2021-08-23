
import 'package:flutter_app/app/data/model/user/user_model.dart';

class Auth {
  User? user;
  String token;
  String? tokenType;
  String? fbId;
  int? expiresIn;

  Auth({this.user, required this.token, this.tokenType, this.fbId, this.expiresIn});

  Auth.fromJson(Map<String, dynamic> json):
    user = json['user'] != null ? User.fromJson(json['user']) : json['user'],
    token = json['token'] ?? json['token'],
    tokenType = json['tokenType'] ?? json['tokenType'],
    fbId = json['fb_id'] ?? json['fb_id'],
    expiresIn = json['expiresIn'] ?? json['expiresIn'];

}