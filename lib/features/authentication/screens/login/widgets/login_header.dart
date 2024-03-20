import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image(
        image: AssetImage(dark ? TImages.lightAppLogo : TImages.darkAppLogo),
        width: THelperFunctions.screenWidth() * 0.24,
        height: THelperFunctions.screenHeight() * 0.24,
      ),
      Text(TTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium),
      const SizedBox(height: TSizes.sm),
      Text(TTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),
    ]);
  }
}
