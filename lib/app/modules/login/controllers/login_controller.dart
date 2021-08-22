import 'package:flutter/material.dart';
import 'package:flutter_app/app/data/authentication/authentication_controller.dart';
import 'package:flutter_app/app/data/authentication/authentication_state.dart';
import 'package:flutter_app/app/modules/initial/views/initial_page.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  final formKey = GlobalKey<FormState>();
  final _authController = Get.find<AuthenticationController>();
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  final TextEditingController usernameController  = TextEditingController();
  final TextEditingController passwordController  = TextEditingController();

  void login() async  {
    if(_authController.state is Authenticated){
      Get.off(() => InitialPage());
    }

    if(usernameController.text.isEmpty) return null;

    _authController.signIn(usernameController.text, passwordController.text);
  }
  
  loginWithGoogle() async {
    final LoginResult result = await FacebookAuth.i.login(
      permissions: ['public_profile', 'email']
    );
    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;
      await  _authController.signInWithData(accessToken);
    }
    print(result.status);
  }

}
