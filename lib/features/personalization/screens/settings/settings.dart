import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_mart/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:e_mart/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:e_mart/common/widgets/text/section_heading.dart';
import 'package:e_mart/features/authentication/controllers/login/login_controller.dart';
import 'package:e_mart/features/personalization/screens/address/address.dart';
import 'package:e_mart/features/personalization/screens/profile/profile.dart';
import 'package:e_mart/features/shop/screens/order/order.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreens extends StatelessWidget {
  const SettingScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //HEADER
            TPrimaryHeaderContainer(
                child: Column(children: [
              TAppBar(
                  title: Text(
                'Account',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: TColors.white),
              )),
              TUserProfileTile(
                onPressed: () => Get.to(() => const ProfileScreen()),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              )
            ])),

            //BODY
            Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    //ACCOUNT SETTINGS
                    const TSectionHeading(
                      title: 'Account Settings',
                      showActionButton: false,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TSettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'My Addresses',
                      subTitle: 'Set shopping delivery address',
                      onTap: () => Get.to(() => const AddressScreen()),
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subTitle: 'Add, remove products and move to checkout',
                      onTap: () {},
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subTitle: 'In-progress and Completed Orders',
                      onTap: () => Get.to(() => const OrderScreen()),
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subTitle: 'Withdraw balance to registered bank account',
                      onTap: () {},
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subTitle: 'List of all the discounted coupons',
                      onTap: () {},
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subTitle: 'Set any kind of notification message',
                      onTap: () {},
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subTitle: 'Manage data usage and connected accounts',
                      onTap: () {},
                    ),

                    //APP SETTINGS
                    const SizedBox(height: TSizes.spaceBtwSections),
                    const TSectionHeading(
                      title: 'App Settings',
                      showActionButton: false,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subTitle: 'Upload Data to your Cloud Database',
                      onTap: () {},
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.location,
                      title: 'Geolocation',
                      subTitle: 'Set recommendation based on location',
                      trailing: Switch(
                        value: true,
                        onChanged: (value) {},
                      ),
                      onTap: () {},
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.security_user,
                      title: 'Safe Mode',
                      subTitle: 'Search result is safe for all ages',
                      trailing: Switch(
                        value: false,
                        onChanged: (value) {},
                      ),
                      onTap: () {},
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.image,
                      title: 'HD Image Quality',
                      subTitle: 'Set image quality to be seen',
                      trailing: Switch(
                        value: false,
                        onChanged: (value) {},
                      ),
                      onTap: () {},
                    ),

                    //Logout
                    const SizedBox(height: TSizes.spaceBtwSections),
                    SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                            onPressed: controller.logOut,
                            child: const Text('Logout'))),
                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
