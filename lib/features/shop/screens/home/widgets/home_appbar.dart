import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:e_mart/features/authentication/controllers/logout/logout_controller.dart';
import 'package:e_mart/features/shop/screens/cart/cart.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(UserController());
    final logoutController = Get.put(LogoutController());

    return TAppBar(
      title: Row(
        children: [
          IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Iconsax.menu)),
          Text("E_MART",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .apply(color: TColors.grey)),
        ],
      ),
      /*Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColors.grey)),
          Obx(
            () => Text(controller.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: TColors.white)),
          ),
        ],
      ),*/
      actions: [
        TCartCounterIcon(
          onPressed: () => Get.to(() => const CartScreen()),
          iconColor: TColors.white,
        ),
        IconButton(
            onPressed: () => {logoutController.logOut()},
            icon: const Icon(
              Iconsax.logout,
              color: TColors.white,
            ))
      ],
    );
  }
}
