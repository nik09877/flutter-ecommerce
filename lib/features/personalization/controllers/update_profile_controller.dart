import 'package:e_mart/common/widgets/loaders/circular_loader.dart';
import 'package:e_mart/data/repositories/authentication_repository.dart';
import 'package:e_mart/data/repositories/user_repository.dart';
import 'package:e_mart/features/personalization/controllers/user_controller.dart';
import 'package:e_mart/features/personalization/screens/profile/profile.dart';
import 'package:e_mart/main.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/helpers/network_manager.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController {
  static UpdateProfileController get instance => Get.find();

  //observables

  //variables
  static final userController = Get.put(UserController());

  final email = TextEditingController(text: userController.user.value.email);
  final firstName =
      TextEditingController(text: userController.user.value.firstName);
  final lastName =
      TextEditingController(text: userController.user.value.lastName);
  final username =
      TextEditingController(text: userController.user.value.username);
  final phone =
      TextEditingController(text: userController.user.value.phoneNumber);
  GlobalKey<FormState> updateUserFormKey = GlobalKey<FormState>();

  void updateProfile() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are updating your profile', TImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoadind();
        return;
      }

      //Form Validation
      if (!updateUserFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoadind();

        return;
      }

      //update user
      final userRepo = Get.put(UserRepository());

      final updatedUser = {
        "firstName": firstName.text.trim(),
        "lastName": lastName.text.trim(),
        "username": username.text.trim(),
        "email": email.text.trim(),
        "phoneNumber": phone.text.trim(),
      };
      await userRepo.updateSingleFieldOfUser(
          supabase.auth.currentUser!.id, updatedUser);
      await AuthenticationRepository.instance.updateEmail(
        email.text.trim(),
      );
      userController.user.value =
          await userRepo.getUser(supabase.auth.currentUser!.id);

      //Show Success Message
      TFullScreenLoader.stopLoadind();
      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your profile has been updated!');

      //Move to Success Screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoadind();

      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
