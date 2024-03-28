import 'package:e_mart/common/widgets/loaders/circular_loader.dart';
import 'package:e_mart/features/personalization/models/address_model.dart';
import 'package:e_mart/features/personalization/screens/address/address.dart';
import 'package:e_mart/main.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/helpers/network_manager.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  //observables
  RxList<AddressModel> addresses = <AddressModel>[].obs;
  final selectedAddressId = 0.obs;

  //variables
  final userId = supabase.auth.currentUser!.id;
  final name = TextEditingController();
  final phone = TextEditingController();
  final street = TextEditingController();
  final postal = TextEditingController();
  final district = TextEditingController();
  final state = TextEditingController();
  GlobalKey<FormState> addrFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    getAddresses();
    super.onInit();
  }

  Future getAddresses() async {
    try {
      final data = await supabase.from('Address').select().eq('userId', userId);
      addresses.value = data.map((addr) {
        addr.remove("userId");
        return AddressModel.fromJson(addr);
      }).toList();
      if (addresses.isNotEmpty) selectedAddressId.value = addresses[0].id!;
    } catch (e) {
      addresses([]);
    }
  }

  Future addNewAddress() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Adding new address', TImages.docerAnimation);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoadind();
        return;
      }

      //Form Validation
      if (!addrFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoadind();

        return;
      }

      //check valid pincode and state, district
      // await checkValidAddress();

      //Add address in Supabase
      Map<String, dynamic> json = {
        'name': name.text.trim(),
        'phoneNumber': phone.text.trim(),
        'street': street.text.trim(),
        'postalCode': postal.text.trim(),
        'district': district.text.trim(),
        'state': state.text.trim(),
        "userId": userId
      };

      List<Map<String, dynamic>> data =
          await supabase.from("Address").insert(json).select();
      data[0].remove("userId");
      final newAddress = AddressModel.fromJson(data[0]);
      addresses.add(newAddress);
      selectedAddressId.value = newAddress.id!;

      //Show Success Message
      TFullScreenLoader.stopLoadind();
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your new address has been added!');
      Get.off(() => const AddressScreen());
    } catch (e) {
      TFullScreenLoader.stopLoadind();

      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Future checkValidAddress() async {
  //   try {
  //     final res = await http.get(Uri.parse(
  //       'https://api.postalpincode.in/pincode/\${postal.text.trim()}',
  //     ));
  //     final data = jsonDecode(res.body);
  //     print(data);
  //   } catch (e) {
  //     TFullScreenLoader.stopLoadind();
  //     TLoaders.errorSnackBar(title: 'Oh Snap!', message: TTexts.errorMsg);
  //   }
  // }
}
