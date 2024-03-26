import 'package:e_mart/common/widgets/loaders/circular_loader.dart';
import 'package:e_mart/data/repositories/authentication_repository.dart';
import 'package:e_mart/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:e_mart/features/personalization/controllers/user_controller.dart';
import 'package:e_mart/main.dart';
import 'package:e_mart/navigation_menu.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/helpers/network_manager.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ResetPasswordController extends GetxController {
  static ResetPasswordController get instance => Get.find();

  //observables
  final showPassword = false.obs;

  //variables
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());
  final localStorage = GetStorage();
  var authSubscription;

  @override
  void onInit() {
    authSubscription = supabase.auth.onAuthStateChange.listen((data) async {
      final AuthChangeEvent event = data.event;
      if (event == AuthChangeEvent.passwordRecovery) {
        try {
          // redirect user to password recovery page
          TFullScreenLoader.stopLoadind();
          Get.off(() => const ResetPassword());
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

  /* Update User Credentials */
  Future sendResetPasswordLink() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Redirecting to Password Recovery Screen', TImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoadind();
        return;
      }

      //Form Validation
      if (!emailFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoadind();

        return;
      }

      await AuthenticationRepository.instance
          .sendResetPasswordLink(email.text.trim());

      TFullScreenLoader.stopLoadind();
    } catch (e) {
      TFullScreenLoader.stopLoadind();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future updatePassword() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are updating your credentials', TImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoadind();
        return;
      }

      //Form Validation
      if (!passwordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoadind();

        return;
      }

      //updatePassword
      await AuthenticationRepository.instance
          .updatePassword(password.text.trim());

      //Save User data if remember me is selected
      localStorage.write('REMEMBER_ME', true);

      //Show Success Message
      TFullScreenLoader.stopLoadind();
      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'Password updated Successfully!');

      //Move to HomePage
      Get.offAll(() => const NavigationMenu());
    } catch (e) {
      TFullScreenLoader.stopLoadind();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
