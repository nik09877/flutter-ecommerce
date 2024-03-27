import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/chips/choice_chip.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_mart/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:e_mart/common/widgets/icons/circular_icon.dart';
import 'package:e_mart/common/widgets/product_cards/product_card_vertical.dart';
import 'package:e_mart/common/widgets/text/brand_title_text_with_verified_icon.dart';
import 'package:e_mart/common/widgets/text/product_title_text.dart';
import 'package:e_mart/common/widgets/text/section_heading.dart';
import 'package:e_mart/features/shop/controllers/cart_controller.dart';
import 'package:e_mart/features/shop/controllers/review_controller.dart';
import 'package:e_mart/features/shop/controllers/wishlist_controller.dart';
import 'package:e_mart/features/shop/models/product_model.dart';
import 'package:e_mart/features/shop/screens/cart/cart.dart';
import 'package:e_mart/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/enums.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    final reviewController = Get.put(ReviewController());
    reviewController.getAllReviews(product.id!);

    return Scaffold(
        bottomNavigationBar: TBottomAddToCart(product: product),
        body: SingleChildScrollView(
            child: Column(
          children: [
            /// 1 - Product Image Slider
            TProductImageSlider(image: (product.image)!, product: product),

            /// 2 - Product Details
            Padding(
                padding: const EdgeInsets.only(
                    right: TSizes.defaultSpace,
                    left: TSizes.defaultSpace,
                    bottom: TSizes.defaultSpace),
                child: Column(children: [
                  /// Rating & Share Button
                  TRatingAndShare(
                    rating: product.rating!.rate ?? 5.0,
                    reviews: product.rating!.count ?? 200,
                  ),

                  //PRICE TITLE STOCK BRAND
                  TProductMetaData(product: product),

                  //Attributes
                  // const TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  //Description
                  const TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description ?? "",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  //Reviews
                  const Divider(),
                  // const SizedBox(height: TSizes.spaceBtwItems / 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => TSectionHeading(
                          title: 'Reviews(${reviewController.reviewCnt})',
                          showActionButton: false,
                        ),
                      ),
                      IconButton(
                          onPressed: () => Get.to(() => ProductReviewsScreen(
                                productId: product.id!,
                              )),
                          icon: const Icon(Iconsax.arrow_right_3, size: 18))
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  //Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => cartController.addToCart(product),
                          child: const Text('Add to cart'))),
                  // const SizedBox(height: TSizes.spaceBtwSections),
                ]))
          ],
        )));
  }
}

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final cartController = Get.put(CartController());

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? TColors.darkerGrey : TColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(TSizes.cardRadiusLg),
            topRight: Radius.circular(TSizes.cardRadiusLg),
          )), // BorderRadius. only, Box Decoration
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              TCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: TColors.darkGrey,
                width: 40,
                height: 40,
                color: TColors.white,
                onPressed: () => cartController.removeFromCart(product),
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Obx(() => Text(
                  '${cartController.cartCount.value != -1 ? cartController.productCountInCart(product.id!) : 0}',
                  style: Theme.of(context).textTheme.titleSmall)),
              const SizedBox(width: TSizes.spaceBtwItems),
              TCircularIcon(
                icon: Iconsax.add,
                backgroundColor: TColors.black,
                width: 40,
                height: 40,
                color: TColors.white,
                onPressed: () => cartController.addToCart(product),
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () => Get.to(() => const CartScreen()),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: TColors.black,
                side: const BorderSide(color: TColors.black),
              ),
              child: const Text('Go to Cart'))
        ],
      ), // Row
    ); // Container
  }
}

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// Selected Attribute Pricing & Description
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              /// Title, Price and Stock Staus
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const TSectionHeading(
                    title: 'Variation', showActionButton: false),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const TProductTitleText(
                            title: 'Price : ', smallSize: true),
                        const SizedBox(width: TSizes.spaceBtwItems),

                        /// Actual Price
                        Text('\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough)),
                        const SizedBox(width: TSizes.spaceBtwItems / 2),

                        /// Sale Price
                        const TProductPriceText(
                          price: '20',
                        ),
                      ],
                    ),

                    ///STOCK
                    Row(
                      children: [
                        const TProductTitleText(
                          title: 'Stock : ',
                          smallSize: true,
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems / 2),
                        Text('In Stock',
                            style: Theme.of(context).textTheme.titleMedium)
                      ],
                    )
                  ],
                ),
              ]),

              /// Variation Description
              const TProductTitleText(
                title:
                    'This is the Description of the Product and it can go up to max 4 lines.',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        /// -- Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Colors'),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                  text: 'Green',
                  selected: true,
                  onSelected: (value) {},
                ),
                TChoiceChip(
                  text: 'Blue',
                  onSelected: (value) {},
                  selected: false,
                ),
                TChoiceChip(
                  text: 'Yellow',
                  onSelected: (value) {},
                  selected: false,
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Size'),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(spacing: 8, children: [
              TChoiceChip(
                text: 'EU 34',
                onSelected: (value) {},
                selected: true,
              ),
              TChoiceChip(
                text: 'EU 36',
                onSelected: (value) {},
                selected: false,
              ),
              TChoiceChip(
                text: 'EU 38',
                onSelected: (value) {},
                selected: false,
              ),
            ])
          ],
        )
      ],
    );
  }
}

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('25%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black)),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            /// Price
            Text('₹${product.price! + 300}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: TSizes.spaceBtwItems),
            TProductPriceText(price: '${product.price}', isLarge: true),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// Title
        TProductTitleText(title: product.title ?? " "),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            // TCircularImage(
            //   padding: 4,
            //   image: TImages.clothIcon,
            //   width: 32,
            //   height: 32,
            //   overlayColor: dark ? TColors.white : TColors.black,
            // ),
            TBrandTitleWithVerifiedIcon(
              title: product.category ?? "",
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}

class TRatingAndShare extends StatelessWidget {
  const TRatingAndShare({
    super.key,
    required this.rating,
    required this.reviews,
  });
  final double rating;
  final int reviews;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Rating
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber, size: 24),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: rating.toString(),
                  style: Theme.of(context).textTheme.bodyLarge),
              // TextSpan(text: '($reviews)'),
            ]) // TextSpan
                ) // Text.rich
          ],
        ), // Row
        /// Share Button
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share, size: TSizes.iconMd))
      ],
    );
  }
}

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.image,
    required this.product,
  });
  final String image;
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final wishlistController = Get.put(WishlistController());

    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(child: Image(image: NetworkImage(image))),
              ),
            ),

            /// Image Slider
            // Positioned(
            //   right: 0,
            //   bottom: 30,
            //   child: SizedBox(
            //     height: 80,
            //     child: ListView.separated(
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       physics: const AlwaysScrollableScrollPhysics(),
            //       itemCount: 4,
            //       separatorBuilder: (_, __) =>
            //           const SizedBox(width: TSizes.spaceBtwItems),
            //       itemBuilder: (_, index) => TRoundedImage(
            //         width: 80,
            //         backgroundColor: dark ? TColors.dark : TColors.white,
            //         border: Border.all(color: TColors.primary),
            //         padding: const EdgeInsets.all(TSizes.sm),
            //         imageUrl: TImages.productImage3,
            //       ),
            //     ),
            //   ),
            // ),

            /// Appbar Icons
            TAppBar(
              showBackArrow: true,
              actions: [
                Obx(
                  () => TCircularIcon(
                    icon: Iconsax.heart5,
                    color: wishlistController.productInWishlist(product.id!)
                        ? Colors.red
                        : null,
                    onPressed: () {
                      if (wishlistController.productInWishlist(product.id!)) {
                        wishlistController.removeFromWishlist(product);
                      } else {
                        wishlistController.addToWishlist(product);
                      }
                    },
                  ),
                )
              ],
            )
            // TAppBar
          ],
        ),
      ),
    );
  }
}
