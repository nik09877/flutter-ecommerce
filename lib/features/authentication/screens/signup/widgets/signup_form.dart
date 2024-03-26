import 'package:e_mart/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:e_mart/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());

    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            //First and Last Name
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    validator: (value) =>
                        TValidator.validateEmptyText('First Name', value),
                    controller: controller.firstName,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    validator: (value) =>
                        TValidator.validateEmptyText('Last Name', value),
                    controller: controller.lastName,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields),

            //username
            TextFormField(
              validator: (value) =>
                  TValidator.validateEmptyText('Username', value),
              controller: controller.username,
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields),

            //email
            TextFormField(
              validator: (value) => TValidator.validateEmail(value),
              controller: controller.email,
              decoration: const InputDecoration(
                  labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields),

            //phone number
            TextFormField(
              validator: (value) => TValidator.validatePhoneNumber(value),
              controller: controller.phone,
              decoration: const InputDecoration(
                  labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
            ),

            const SizedBox(height: TSizes.spaceBtwInputFields),

            //password
            Obx(
              () => TextFormField(
                  validator: (value) => TValidator.validatePassword(value),
                  controller: controller.password,
                  obscureText: controller.showPassword.value,
                  decoration: InputDecoration(
                    labelText: TTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () => controller.showPassword.value =
                            !controller.showPassword.value,
                        icon: Icon(controller.showPassword.value
                            ? Iconsax.eye
                            : Iconsax.eye_slash)),
                  )),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            Row(
              children: [
                Obx(
                  () => SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                          value: controller.privacyPolicy.value,
                          onChanged: (value) {
                            controller.privacyPolicy.value =
                                !controller.privacyPolicy.value;
                          })),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Expanded(
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                        text: '${TTexts.iAgreeTo} ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: '${TTexts.privacyPolicy} ',
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: dark ? TColors.white : TColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  dark ? TColors.white : TColors.primary,
                            )),
                    TextSpan(
                        text: '${TTexts.and} ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: TTexts.termsOfUse,
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: dark ? TColors.white : TColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  dark ? TColors.white : TColors.primary,
                            )),
                  ])),
                )
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            //signup button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: controller.signup,
                    child: const Text(TTexts.createAccount)))
          ],
        ));
  }
}
