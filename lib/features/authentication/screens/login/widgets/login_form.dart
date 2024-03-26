import 'package:e_mart/features/authentication/controllers/login/login_controller.dart';
import 'package:e_mart/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:e_mart/features/authentication/screens/signup/signup.dart';
import 'package:e_mart/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.email),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
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
              const SizedBox(height: TSizes.spaceBtwInputFields / 2),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  Obx(
                    () => Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (value) {
                        controller.rememberMe.value =
                            !controller.rememberMe.value;
                      },
                    ),
                  ),
                  const Text(TTexts.rememberMe)
                ]),
                TextButton(
                    onPressed: () => Get.to(() => const ForgetPassword()),
                    child: const Text(TTexts.forgetPassword))
              ]),
              const SizedBox(height: TSizes.spaceBtwSections / 2),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: controller.login,
                      child: const Text(TTexts.signIn))),
              const SizedBox(height: TSizes.spaceBtwSections / 2),
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () => Get.to(() => const SignupScreen()),
                      child: const Text(TTexts.createAccount))),
            ],
          ),
        ));
  }
}
