import 'package:e_mart/data/repositories/user_repository.dart';
import 'package:e_mart/features/authentication/models/user_model.dart';
import 'package:e_mart/main.dart';
// import 'package:e_mart/main.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  //observables
  Rx<UserModel> user = UserModel.empty().obs;

  //variables
  final userRepo = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  Future<void> saveUserRecord(User? user) async {
    try {
      final profileImageUrl = user?.userMetadata?['avatar_url'];
      final fullName = user?.userMetadata?['full_name'];

      final nameParts = UserModel.nameParts(fullName ?? '');
      final username = UserModel.generateUsername(fullName ?? '');

      final newUser = UserModel(
          id: user?.id ?? '',
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(" ") : "",
          username: username,
          email: user?.email ?? '',
          phoneNumber: user?.phone ?? '',
          profilePicture: profileImageUrl);
      userRepo.saveUser(newUser);
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong while saving your information. You can re-save your data in your profile');
    }
  }

  Future<void> getUser() async {
    try {
      final user = await userRepo.getUser(supabase.auth.currentUser!.id);
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
      // TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
