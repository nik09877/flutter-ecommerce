import 'package:e_mart/features/shop/controllers/product_controller.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/device/device_utility.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer(
      {super.key,
      required this.text,
      this.icon = Iconsax.search_normal,
      this.showBackground = true,
      this.showBorder = true,
      this.showSearchField = false,
      this.onTap,
      this.padding =
          const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace)});
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;
  final bool showSearchField;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final productController = Get.put(ProductController());

    return GestureDetector(
      onTap: onTap,
      child: showSearchField
          ? Flexible(
              child: TextFormField(
                expands: false,
                controller: productController.search,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.search_normal_1),
                    labelText: text),
                onChanged: (value) {
                  productController.filterProducts();
                },
              ),
            )
          : Padding(
              padding: padding,
              child: Container(
                  width: TDeviceUtils.getScreenWidth(context),
                  padding: const EdgeInsets.all(TSizes.md),
                  decoration: BoxDecoration(
                      color: showBackground
                          ? dark
                              ? TColors.dark
                              : TColors.light
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                      border:
                          showBorder ? Border.all(color: TColors.grey) : null),
                  child: Row(
                    children: [
                      const Icon(Iconsax.search_normal, color: TColors.grey),
                      const SizedBox(width: TSizes.spaceBtwItems),
                      Text(text, style: Theme.of(context).textTheme.bodySmall)
                    ],
                  )),
            ),
    );
  }
}
