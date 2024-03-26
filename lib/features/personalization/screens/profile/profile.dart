import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/images/circular_image.dart';
import 'package:e_mart/common/widgets/text/section_heading.dart';
import 'package:e_mart/features/personalization/controllers/user_controller.dart';
import 'package:e_mart/features/personalization/screens/profile/update_profile.dart';
import 'package:e_mart/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/formatters/formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
        appBar: const TAppBar(showBackArrow: true, title: Text('Profile')),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(children: [
                  /// Profile Picture
                  SizedBox(
                    width: double.infinity,
                    child: Obx(
                      () => Column(
                        children: [
                          TCircularImage(
                              image: controller
                                      .user.value.profilePicture!.isNotEmpty
                                  ? controller.user.value.profilePicture!
                                  : TImages.user,
                              width: 80,
                              height: 80),
                          // TextButton(
                          //     onPressed: () {},
                          //     child: const Text('Change Profile Picture'))
                        ],
                      ),
                    ), // Column
                  ), // SizedBox

                  /// Details
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const TSectionHeading(
                    title: 'Profile Information',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  Obx(
                    () => TProfileMenu(
                      title: 'Name',
                      value: controller.user.value.fullName,
                      onPressed: () {},
                    ),
                  ),
                  Obx(
                    () => TProfileMenu(
                      title: 'Username',
                      value: controller.user.value.username ?? "",
                      onPressed: () {},
                    ),
                  ),

                  const SizedBox(height: TSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Heading Personal Info
                  const TSectionHeading(
                      title: 'Personal Information', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // TProfileMenu(
                  //     title: 'User ID',
                  //     value: '45689',
                  //     icon: Iconsax.copy,
                  //     onPressed: () {}),
                  Obx(
                    () => TProfileMenu(
                        title: 'E-mail',
                        value: controller.user.value.email ?? "",
                        onPressed: () {}),
                  ),

                  Obx(
                    () => TProfileMenu(
                        title: 'Phone',
                        value: controller.user.value.phoneNumber!.isNotEmpty
                            ? TFormatter.formatPhoneNumber(
                                controller.user.value.phoneNumber!)
                            : "",
                        onPressed: () {}),
                  ),
                  // TProfileMenu(
                  //     title: 'Gender', value: 'Male', onPressed: () {}),
                  // TProfileMenu(
                  //     title: 'Date of Birth',
                  //     value: '10 Oct, 2001',
                  //     onPressed: () {}),

                  const Divider(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Center(
                    child: SizedBox(
                      width: 220,
                      child: ElevatedButton(
                          onPressed: () => Get.to(() => const UpdateProfile()),
                          child: const Text('Update Profile',
                              style: TextStyle(color: Colors.white))),
                    ),
                  )
                ]))));
  }
}
