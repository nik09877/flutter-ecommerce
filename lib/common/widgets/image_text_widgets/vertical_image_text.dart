import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor = TColors.white,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
              height: 56,
              width: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                  color: backgroundColor ??
                      (THelperFunctions.isDarkMode(context)
                          ? TColors.black
                          : TColors.white),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                  child: Image(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                      color: THelperFunctions.isDarkMode(context)
                          ? TColors.dark
                          : TColors.dark)),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
