import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/features/personalization/controllers/update_profile_controller.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:e_mart/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateProfileController());
    return Scaffold(
        appBar:
            const TAppBar(showBackArrow: true, title: Text('Update Profile')),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Form(
                  key: controller.updateUserFormKey,
                  child: Column(
                    children: [
                      //First and Last Name
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              // initialValue: user.value.firstName,
                              validator: (value) =>
                                  TValidator.validateEmptyText(
                                      'First Name', value),
                              controller: controller.firstName,
                              expands: false,
                              decoration: const InputDecoration(
                                  labelText: TTexts.firstName,
                                  prefixIcon: Icon(Iconsax.user)),
                            ),
                          ),
                          const SizedBox(width: TSizes.spaceBtwInputFields),
                          Expanded(
                            child: TextFormField(
                              // initialValue: user.value.lastName,
                              validator: (value) =>
                                  TValidator.validateEmptyText(
                                      'Last Name', value),
                              controller: controller.lastName,
                              expands: false,
                              decoration: const InputDecoration(
                                  labelText: TTexts.lastName,
                                  prefixIcon: Icon(Iconsax.user)),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: TSizes.spaceBtwInputFields),

                      //username
                      TextFormField(
                        validator: (value) =>
                            TValidator.validateEmptyText('Username', value),
                        // initialValue: user.value.username,
                        controller: controller.username,
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: TTexts.username,
                            prefixIcon: Icon(Iconsax.user_edit)),
                      ),

                      const SizedBox(height: TSizes.spaceBtwInputFields),

                      //email
                      TextFormField(
                        validator: (value) => TValidator.validateEmail(value),
                        // initialValue: user.value.email,
                        controller: controller.email,
                        decoration: const InputDecoration(
                            labelText: TTexts.email,
                            prefixIcon: Icon(Iconsax.direct)),
                      ),

                      const SizedBox(height: TSizes.spaceBtwInputFields),

                      //phone number
                      TextFormField(
                        validator: (value) =>
                            TValidator.validatePhoneNumber(value),
                        controller: controller.phone,
                        // initialValue: 'user.value.phoneNumber',
                        decoration: const InputDecoration(
                            labelText: TTexts.phoneNo,
                            prefixIcon: Icon(Iconsax.call)),
                      ),

                      const SizedBox(height: TSizes.spaceBtwSections),
                      //BUTTONS
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: controller.updateProfile,
                              child: const Text('Update'))),
                    ],
                  )),
            ],
          ),
        )));
  }
}
