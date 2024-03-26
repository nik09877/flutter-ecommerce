import 'package:e_mart/common/widgets/loaders/circular_loader.dart';
import 'package:e_mart/data/repositories/authentication_repository.dart';
import 'package:e_mart/features/authentication/screens/login/login.dart';
import 'package:e_mart/features/personalization/controllers/user_controller.dart';
import 'package:e_mart/main.dart';
import 'package:e_mart/navigation_menu.dart';
// import 'package:e_mart/navigation_menu.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/helpers/network_manager.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  //observables
  final showPassword = false.obs;
  final rememberMe = false.obs;

  //variables
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());
  var authSubscription;

  @override
  void onInit() {
    authSubscription =
        supabase.auth.onAuthStateChange.listen((AuthState data) async {
      final AuthChangeEvent event = data.event;
      if (event == AuthChangeEvent.signedIn) {
        try {
          //Store data in supabase
          final Session? session = data.session;
          final User? user = session?.user;
          await userController.saveUserRecord(user);
          TFullScreenLoader.stopLoadind();

          //Move to HomePage
          Get.offAll(() => const NavigationMenu());
        } catch (e) {
          TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
        }
      }
    });

    super.onInit();
  }

  @override
  void dispose() {
    authSubscription.cancel();
    super.dispose();
  }

  void login() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are checking your credentials', TImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoadind();
        return;
      }

      //Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoadind();

        return;
      }

      //login user in Supabase Auth
      await AuthenticationRepository.instance
          .signInWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Save User data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME', true);
        // localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        // localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'You have successfully logged in!');
      //Show Success Message
      // TFullScreenLoader.stopLoadind();
      // TLoaders.successSnackBar(
      //     title: 'Congratulations',
      //     message: 'You have successfully logged in!');

      //Move to HomePage
      // Get.offAll(() => const NavigationMenu());
    } catch (e) {
      TFullScreenLoader.stopLoadind();

      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  void signinWithGoogle() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are checking your credentials', TImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoadind();
        return;
      }

      // login
      await AuthenticationRepository.instance.signInWithGoogle();
      localStorage.write('REMEMBER_ME', true);
    } catch (e) {
      // TFullScreenLoader.stopLoadind();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  void logOut() async {
    try {
      await AuthenticationRepository.instance.logout();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
