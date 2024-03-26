import 'package:e_mart/features/authentication/models/user_model.dart';
import 'package:e_mart/main.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  //variable

  /* Function to save user data to supabase */
  Future<void> saveUser(UserModel user) async {
    try {
      await supabase.from('Users').insert(user.toJson());
    } catch (e) {
      throw TTexts.errorMsg;
    }
  }

  //Fetch User
  Future<UserModel> getUser(String id) async {
    try {
      final data = await supabase.from('Users').select().eq('id', id);
      if (data.isEmpty) {
        return UserModel.empty();
      }
      return UserModel.fromJson(data[0]);
    } catch (e) {
      throw TTexts.errorMsg;
    }
  }

  //update User
  Future<void> updateUser(UserModel updatedUser) async {
    try {
      await supabase
          .from('Users')
          .update(updatedUser.toJson())
          .match({'id': updatedUser.id});
    } catch (e) {
      throw TTexts.errorMsg;
    }
  }

  //update single field
  Future<void> updateSingleFieldOfUser(
      String id, Map<String, dynamic> json) async {
    try {
      await supabase.from('Users').update(json).match({'id': id});
    } catch (e) {
      throw TTexts.errorMsg;
    }
  }

  //delete user
  Future<void> deleteUser(
    String id,
  ) async {
    try {
      await supabase.from('Users').delete().match({'id': id});
    } catch (e) {
      throw TTexts.errorMsg;
    }
  }
}
