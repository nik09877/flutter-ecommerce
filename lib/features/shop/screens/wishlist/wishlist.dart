import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/icons/circular_icon.dart';
import 'package:e_mart/common/widgets/layouts/grid_layout.dart';
import 'package:e_mart/common/widgets/product_cards/product_card_vertical.dart';
import 'package:e_mart/features/shop/controllers/wishlist_controller.dart';
import 'package:e_mart/features/shop/screens/home/home.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistController = Get.put(WishlistController());

    return Scaffold(
        appBar: TAppBar(
          title: Text('Wishlist',
              style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            TCircularIcon(
              icon: Iconsax.add,
              onPressed: () => Get.to(const HomeScreen()),
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    Obx(
                      () => TGridLayout(
                          itemCount: wishlistController.wishList.length,
                          itemBuilder: (_, index) => TProductCardVertical(
                              product: wishlistController.wishList[index])),
                    )
                  ],
                ))));
  }
}
