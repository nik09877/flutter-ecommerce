import 'package:e_mart/common/widgets/success_screen/success_screen.dart';
import 'package:e_mart/features/authentication/screens/login/login.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //IMAGE
              Image(
                image: const AssetImage(TImages.deliveredEmailIllustration),
                width: THelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              //TITLE AND SUBTITLE
              Text(TTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),

              const SizedBox(height: TSizes.spaceBtwItems),

              Text('nikhilkumarmishra@gmail.com',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),

              const SizedBox(height: TSizes.spaceBtwItems),

              Text(TTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),

              const SizedBox(height: TSizes.spaceBtwSections),

              //BUTTONS
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => SuccessScreen(
                            image: TImages.deliveredEmailIllustration,
                            title: TTexts.yourAccountCreatedTitle,
                            subTitle: TTexts.yourAccountCreatedSubTitle,
                            onPressed: () => Get.to(() => const LoginScreen()),
                          )),
                      child: const Text(TTexts.tContinue))),

              const SizedBox(height: TSizes.spaceBtwItems),

              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text(TTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
