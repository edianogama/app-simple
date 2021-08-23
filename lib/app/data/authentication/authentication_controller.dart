import 'package:flutter_app/app/common/storage/storage.dart';
import 'package:flutter_app/app/data/authentication/authentication_service.dart';
import 'package:flutter_app/app/data/authentication/authentication_state.dart';
import 'package:flutter_app/app/routes/app_pages.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {

  final AuthenticationService _authenticationService;
  final _authenticationStateStream = AuthenticationState().obs;

  AuthenticationState get state => _authenticationStateStream.value;

  AuthenticationController(this._authenticationService);
  
  @override
  void onInit() {
    _getAuthenticatedUser();
    super.onInit();
  }

  Future<void> signIn(String email, String password) async {
    final user = await _authenticationService.signInWithUsernameAndPassword(email, password);
    _authenticationStateStream.value = Authenticated(user: user.user);
    Get.offAndToNamed(Routes.INITIAL);
  }
  
  Future<void> signInWithData(AccessToken accessToken) async {
    final user = await _authenticationService.signInWithCredential(accessToken.token);
    _authenticationStateStream.value = Authenticated(user: user.user);
    Get.offAndToNamed(Routes.INITIAL);
  }

  void signOut() async {
    _authenticationService.signOut();
     print('token out =====>');
    _authenticationStateStream.value = UnAuthenticated();
  }

  void _getAuthenticatedUser() async {
    _authenticationStateStream.value = AuthenticationLoading();

    final user = await _authenticationService.getCurrentUser();
    if (user == null) {
      _authenticationStateStream.value = UnAuthenticated();
    } else {
      _authenticationStateStream.value = Authenticated(user: user);
    }
  }
}