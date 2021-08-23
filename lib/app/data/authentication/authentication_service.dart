import 'dart:convert';

import 'package:flutter_app/app/common/storage/storage.dart';
import 'package:flutter_app/app/common/values/strings.dart';
import 'package:flutter_app/app/data/model/auth/auth_model.dart';
import 'package:flutter_app/app/data/model/user/user_model.dart';
import 'package:flutter_app/app/data/provider/auth_provider.dart';
import 'package:get/get.dart';

class AuthenticationService extends GetxService{
  
  final AuthApiClient apiClient = AuthApiClient();

  Future<dynamic> getCurrentUser() async {
    if (Storage.getValue('gc-token') == null) return null;

    Response<dynamic> jsonResponse = await apiClient.me();

    if (jsonResponse.hasError) return null;

    return User.fromJson(jsonResponse.body);
  }

  Future<Auth> signInWithUsernameAndPassword(String username, String password) async {
    Response<dynamic> jsonResponse = await apiClient.login(username, password);

    if (jsonResponse.hasError) {
      Get.defaultDialog(title: 'Alert', middleText: Strings.defaultMessageError);
      throw AuthenticationException(message: 'Error');
    }

    Auth userAuthenticated = Auth.fromJson(jsonResponse.body);
    Storage.saveValue('gc-token', userAuthenticated.token);
    return userAuthenticated;
  }

  Future<Auth> signInWithCredential(dynamic payload) async {
    Response<dynamic> jsonResponse = await apiClient.signInWithCredential(payload);

    if (jsonResponse.hasError) {
      Get.defaultDialog(title: 'Alert', middleText: "Ocorreu um erro ao registrar/Logar o usuário, tente novamente!");
      throw AuthenticationException(message: 'Error');
    }

    Auth userAuthenticated = Auth.fromJson(jsonResponse.body);
    Storage.saveValue('gc-token', userAuthenticated.token);
    return userAuthenticated;
  }

  void signOut() {
    Storage.clearStorage();
    return null;
  }
}


class AuthenticationException implements Exception {
  final String message;
  AuthenticationException({this.message = 'Unknown error occurred. '});
}