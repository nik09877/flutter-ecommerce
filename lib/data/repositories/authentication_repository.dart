import 'package:e_mart/features/authentication/screens/login/login.dart';
import 'package:e_mart/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_mart/main.dart';
import 'package:e_mart/navigation_menu.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variable
  final deviceStorage = GetStorage();

  //called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //Function to show relevant screen
  screenRedirect() async {
    final Session? session = supabase.auth.currentSession;
    if (session != null && deviceStorage.read('REMEMBER_ME') == true) {
      Get.offAll(() => const NavigationMenu());
    } else {
      //Local Storage
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }

  /* EMAIL AND PASSWORD SIGN UP/IN/OUT */
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      final AuthResponse res = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      return res;
      // final Session? session = res.session;
      // final User? user = res.user;
    } catch (e) {
      throw TTexts.errorMsg;
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw 'Your email or password is wrong. Please try again';
    }
  }

  /* Social SIGN IN */
  Future signInWithGoogle() async {
    try {
      return await supabase.auth.signInWithOAuth(OAuthProvider.google,
          redirectTo: "io.supabase.flutterecommerce://login-callback");

      /// Web Client ID that you registered with Google Cloud.
      // const webClientId =
      //     '285098785064-ubrqt2p5dn4b16gk02af87o199gti43p.apps.googleusercontent.com';

      //  TODO: update the iOS client ID with your own.
      // iOS Client ID that you registered with Google Cloud.
      // const iosClientId = 'my-ios.apps.googleusercontent.com';

      // Google sign in on Android will work without providing the Android
      // Client ID registered on Google Cloud.

      // final GoogleSignIn googleSignIn = GoogleSignIn(
      //   // clientId: iosClientId,
      //   serverClientId: webClientId,
      // );
      // final googleUser = await googleSignIn.signIn();
      // final googleAuth = await googleUser!.authentication;
      // final accessToken = googleAuth.accessToken;
      // final idToken = googleAuth.idToken;

      // if (accessToken == null) {
      //   throw 'No Access Token found.';
      // }
      // if (idToken == null) {
      //   throw 'No ID Token found.';
      // }

      // return supabase.auth.signInWithIdToken(
      //   provider: OAuthProvider.google,
      //   idToken: idToken,
      //   accessToken: accessToken,
      // );
    } catch (e) {
      throw TTexts.errorMsg;
    }
  }

  /* Update User Credentials */
  Future sendResetPasswordLink(String email) async {
    try {
      await supabase.auth.resetPasswordForEmail(email,
          redirectTo: "io.supabase.flutterecommerce://login-callback");
    } catch (e) {
      throw TTexts.errorMsg;
    }
  }

  Future updatePassword(String password) async {
    try {
      await supabase.auth.updateUser(
        UserAttributes(
          password: password,
        ),
      );
    } catch (e) {
      throw 'Couldn\'t update user password';
    }
  }

  Future updateEmail(String email) async {
    try {
      await supabase.auth.updateUser(
        UserAttributes(
          email: email,
        ),
      );
    } catch (e) {
      throw 'Couldn\'t update user password';
    }
  }

  /* Logout and Delete User */
  Future<void> logout() async {
    try {
      await supabase.auth.signOut();
      deviceStorage.write('REMEMBER_ME', false);
    } catch (e) {
      throw TTexts.errorMsg;
    }
  }
}
