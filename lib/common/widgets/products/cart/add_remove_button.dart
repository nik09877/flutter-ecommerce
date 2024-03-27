import 'package:e_mart/features/shop/controllers/cart_controller.dart';
import 'package:e_mart/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:e_mart/common/widgets/icons/circular_icon.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TProductQuantityAddRemoveButton extends StatelessWidget {
  const TProductQuantityAddRemoveButton({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: THelperFunctions.isDarkMode(context)
              ? TColors.black
              : TColors.white,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.white
              : TColors.black,
          onPressed: () => cartController.removeFromCart(product),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Obx(() => Text(
            '${cartController.cartCount.value != -1 ? cartController.productCountInCart(product.id!) : 0}',
            style: Theme.of(context).textTheme.titleSmall)),
        const SizedBox(width: TSizes.spaceBtwItems),
        TCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: TColors.white,
          backgroundColor: TColors.primary,
          onPressed: () => cartController.addToCart(product),
        ),
      ],
    );
  }
}
