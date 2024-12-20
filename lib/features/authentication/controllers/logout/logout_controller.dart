import 'package:e_mart/data/repositories/authentication_repository.dart';
import 'package:e_mart/features/authentication/screens/login/login.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController {
  static LogoutController get instance => Get.find();

  void logOut() async {
    try {
      await AuthenticationRepository.instance.logout();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
