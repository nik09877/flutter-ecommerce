import 'package:e_mart/common/styles/shadows.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_mart/common/widgets/icons/circular_icon.dart';
import 'package:e_mart/common/widgets/images/rounded_image.dart';
import 'package:e_mart/common/widgets/text/brand_title_text_with_verified_icon.dart';
import 'package:e_mart/common/widgets/text/product_title_text.dart';
import 'package:e_mart/features/shop/controllers/cart_controller.dart';
import 'package:e_mart/features/shop/controllers/wishlist_controller.dart';
import 'package:e_mart/features/shop/models/product_model.dart';
import 'package:e_mart/features/shop/screens/product_details/product_details.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final wishlistController = Get.put(WishlistController());
    final cartController = Get.put(CartController());

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? TColors.darkGrey : TColors.white),
        child: Column(
          children: [
            // BANNER, BUTTONS
            TRoundedContainer(
              height: 180,
              width: double.infinity,
              padding: const EdgeInsets.all(TSizes.sm),
              // padding: const EdgeInsets.all(1),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  TRoundedImage(
                    imageUrl: product.image!,
                    applyImageRadius: true,
                    // isNetworkImage: true,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  // Positioned(
                  //   top: 12,
                  //   child: TRoundedContainer(
                  //       radius: TSizes.sm,
                  //       backgroundColor: TColors.secondary.withOpacity(0.8),
                  //       padding: const EdgeInsets.symmetric(
                  //           horizontal: TSizes.sm, vertical: TSizes.xs),
                  //       child: Text('25%',
                  //           style: Theme.of(context)
                  //               .textTheme
                  //               .labelLarge!
                  //               .apply(color: TColors.black))),
                  // ),
                  Obx(
                    () => Positioned(
                      right: 0,
                      top: 0,
                      child: TCircularIcon(
                        icon: Iconsax.heart5,
                        color: wishlistController.productInWishlist(product.id!)
                            ? Colors.red
                            : null,
                        onPressed: () {
                          if (wishlistController
                              .productInWishlist(product.id!)) {
                            wishlistController.removeFromWishlist(product);
                          } else {
                            wishlistController.addToWishlist(product);
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            //DETAILS
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(
                    title: product.title ?? "",
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  TBrandTitleWithVerifiedIcon(
                    title: product.category ?? "",
                  ),
                ],
              ),
            ),

            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: TProductPriceText(
                      price: product.price.toString(), isLarge: false),
                ),
                Container(
                    decoration: const BoxDecoration(
                        color: TColors.dark,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(TSizes.productImageRadius))),
                    child: SizedBox(
                        width: TSizes.iconLg * 1.2,
                        height: TSizes.iconLg * 1.2,
                        child: Center(
                            child: IconButton(
                                onPressed: () =>
                                    cartController.addToCart(product),
                                icon: const Icon(Iconsax.add),
                                color: TColors.white))))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({
    super.key,
    this.currencySign = '₹',
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,
  });

  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
