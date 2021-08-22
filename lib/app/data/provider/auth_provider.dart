import 'package:flutter_app/app/common/constants.dart';
import 'package:flutter_app/app/common/storage/storage.dart';
import 'package:get/get.dart';

class AuthApiClient extends GetConnect{

  Future<dynamic> login(String username, String password) async {
    return await post(Constants.BASE_URL + "login", {"username": username, "password": password});
  }
  
  Future<dynamic> me() async {
    var token = Storage.getValue('gc-token');
    var response = await get(Constants.BASE_URL + "v1/me",
    headers: {
      'X-Api-Key': 'dR4hLfNMQysJXnf6ZTbTWSv5JRkCpMhO',
      'X-App-Id': 'AHcbMoKFvFwA',
      'Authorization': 'Bearer '+ token
    });
    return response;
  }

  Future<dynamic> signInWithCredential(dynamic payload) async {
    var response = await post(Constants.BASE_URL + "/social/register", payload);
    return response;
  }
}