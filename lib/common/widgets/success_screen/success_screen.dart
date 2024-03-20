import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(
                  top: TSizes.appBarHeight,
                  left: TSizes.defaultSpace,
                  right: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  //IMAGE
                  Image(
                    image: AssetImage(image),
                    width: THelperFunctions.screenWidth() * 0.6,
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  //TITLE AND SUBTITLE
                  Text(title,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center),

                  const SizedBox(height: TSizes.spaceBtwItems),

                  Text(subTitle,
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.center),

                  const SizedBox(height: TSizes.spaceBtwSections),

                  //BUTTONS
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: onPressed,
                          child: const Text(TTexts.tContinue))),
                ],
              ))),
    );
  }
}
