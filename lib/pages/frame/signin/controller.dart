import 'package:chatty/common/entities/entities.dart';
import 'package:chatty/pages/frame/SignIn/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController extends GetxController {
  SignInController();
  final state = SignInState();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'openid',
    ],
  );

  void handleSignIn(String type) async {
    try {
      if (type == 'google') {
        var user = await _googleSignIn.signIn();

        if (user != null) {
          String? displayName = user.displayName;
          String email = user.email;
          String id = user.id;
          String photoUrl = user.photoUrl ?? "assets/icons/google.png";

          LoginRequestEntity loginPanelListRequestEntity = LoginRequestEntity();

          loginPanelListRequestEntity.email = email;
          loginPanelListRequestEntity.name = displayName;
          loginPanelListRequestEntity.avatar = photoUrl;
          loginPanelListRequestEntity.open_id = id;
          loginPanelListRequestEntity.type = 2;
        }
      } else if (type == 'facebook') {
      } else if (type == 'apple') {
      } else if (type == 'phone number') {}
    } catch (error) {
      if (kDebugMode) {
        print('---error with login: $error');
      }
    }
  }
}
