import 'package:e_mart/common/widgets/loaders/circular_loader.dart';
import 'package:e_mart/common/widgets/success_screen/success_screen.dart';
import 'package:e_mart/data/repositories/authentication_repository.dart';
import 'package:e_mart/data/repositories/user_repository.dart';
import 'package:e_mart/features/authentication/models/user_model.dart';
import 'package:e_mart/features/authentication/screens/login/login.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:e_mart/utils/helpers/network_manager.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //observables
  final privacyPolicy = false.obs;
  final showPassword = false.obs;

  //variables
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information', TImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoadind();
        return;
      }

      //Form Validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoadind();

        return;
      }

      //Privacy Policy check
      if (!privacyPolicy.value) {
        TFullScreenLoader.stopLoadind();
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the Privacy & Terms of Use.');

        return;
      }

      //Register user in Supabase Auth
      final AuthResponse res = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //Save Authenticated User data in the DB
      final newUser = UserModel(
          id: res.user!.id,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phone.text.trim(),
          profilePicture: '');
      final userRepo = Get.put(UserRepository());
      userRepo.saveUser(newUser);

      //Show Success Message
      TFullScreenLoader.stopLoadind();
      // TLoaders.successSnackBar(
      //     title: 'Congratulations', message: 'Your account has been created!');
      Get.to(() => const LoginScreen());

      //Move to Success Screen
      // Get.to(() => SuccessScreen(
      //       title: TTexts.yourAccountCreatedTitle,
      //       subTitle: TTexts.yourAccountCreatedSubTitle,
      //       image: TImages.staticSuccessIllustration,
      //       onPressed: () => Get.to(() => const LoginScreen()),
      //     ));
    } catch (e) {
      TFullScreenLoader.stopLoadind();

      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
