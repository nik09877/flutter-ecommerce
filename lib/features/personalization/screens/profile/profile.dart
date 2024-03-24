import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/images/circular_image.dart';
import 'package:e_mart/common/widgets/text/section_heading.dart';
import 'package:e_mart/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TAppBar(showBackArrow: true, title: Text('Profile')),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(children: [
                  /// Profile Picture
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        const TCircularImage(
                            image: TImages.user, width: 80, height: 80),
                        TextButton(
                            onPressed: () {},
                            child: const Text('Change Profile Picture'))
                      ],
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

                  TProfileMenu(
                    title: 'Name',
                    value: 'Nikhil Mishra',
                    onPressed: () {},
                  ),
                  TProfileMenu(
                    title: 'Username',
                    value: 'nikhil_30',
                    onPressed: () {},
                  ),

                  const SizedBox(height: TSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Heading Personal Info
                  const TSectionHeading(
                      title: 'Personal Information', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TProfileMenu(
                      title: 'User ID',
                      value: '45689',
                      icon: Iconsax.copy,
                      onPressed: () {}),
                  TProfileMenu(
                      title: 'E-mail',
                      value: 'nikhilkumarmishra@gmail.com',
                      onPressed: () {}),

                  TProfileMenu(
                      title: 'Phone Number',
                      value: '+91-797-805-9528',
                      onPressed: () {}),
                  TProfileMenu(
                      title: 'Gender', value: 'Male', onPressed: () {}),
                  TProfileMenu(
                      title: 'Date of Birth',
                      value: '10 Oct, 2001',
                      onPressed: () {}),

                  const Divider(),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {},
                        child: const Text('Close Account',
                            style: TextStyle(color: Colors.red))),
                  )
                ]))));
  }
}
