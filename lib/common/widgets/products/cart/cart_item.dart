import 'package:e_mart/common/widgets/images/rounded_image.dart';
import 'package:e_mart/common/widgets/text/brand_title_text_with_verified_icon.dart';
import 'package:e_mart/common/widgets/text/product_title_text.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      //Image
      TRoundedImage(
        imageUrl: TImages.productImage1,
        width: 60,
        height: 60,
        padding: const EdgeInsets.all(TSizes.sm),
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.darkerGrey
            : TColors.light,
      ),
      const SizedBox(width: TSizes.spaceBtwItems),

      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TBrandTitleWithVerifiedIcon(title: 'Nike'),
          const Flexible(
            child: TProductTitleText(
              title: 'Black Sports Shoes',
              maxLines: 1,
            ),
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
                text: 'Color', style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: 'Green', style: Theme.of(context).textTheme.bodyLarge),
            TextSpan(
                text: 'Size', style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: 'UK 08', style: Theme.of(context).textTheme.bodyLarge),
          ]))
        ],
      )
    ]);
  }
}
