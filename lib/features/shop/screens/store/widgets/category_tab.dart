import 'package:e_mart/common/widgets/brands/brand_showcase.dart';
import 'package:e_mart/common/widgets/layouts/grid_layout.dart';
import 'package:e_mart/common/widgets/product_cards/product_card_vertical.dart';
import 'package:e_mart/common/widgets/text/section_heading.dart';
import 'package:e_mart/features/shop/controllers/product_controller.dart';
import 'package:e_mart/features/shop/screens/all_products/all_products.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, this.title = 'Puma'});

  final String title;
  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    return ListView(
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                const TBrandShowCase(
                  images: [
                    TImages.productImage3,
                    TImages.productImage2,
                    TImages.productImage1,
                  ],
                ),

                //products
                TSectionHeading(
                  title: 'You might like',
                  onPressed: () => Get.to(() => const AllProducts()),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Obx(
                  () => TGridLayout(
                      itemCount: productController.products.length < 2
                          ? productController.products.length
                          : productController.products.sublist(0, 2).length,
                      itemBuilder: (_, index) => TProductCardVertical(
                          product: productController.products[index])),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            )),
      ],
    );
  }
}
