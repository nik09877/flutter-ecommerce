import 'package:e_mart/common/widgets/brands/brand_showcase.dart';
import 'package:e_mart/common/widgets/layouts/grid_layout.dart';
import 'package:e_mart/common/widgets/product_cards/product_card_vertical.dart';
import 'package:e_mart/common/widgets/text/section_heading.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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
                  onPressed: () {},
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                TGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => const TProductCardVertical()),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            )),
      ],
    );
  }
}
