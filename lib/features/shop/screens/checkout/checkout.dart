import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_mart/common/widgets/success_screen/success_screen.dart';
import 'package:e_mart/common/widgets/text/section_heading.dart';
import 'package:e_mart/features/shop/screens/cart/cart.dart';
import 'package:e_mart/navigation_menu.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                const TCartItems(showAddRemoveButtons: false),
                const SizedBox(height: TSizes.spaceBtwSections),

                //COUPONS
                const TCouponCode(),
                const SizedBox(height: TSizes.spaceBtwSections),

                //Billing Section
                TRoundedContainer(
                  showBorder: true,
                  padding: const EdgeInsets.all(TSizes.md),
                  backgroundColor: dark ? TColors.black : TColors.white,
                  child: const Column(
                    children: [
                      TBillingAmountSection(),
                      SizedBox(height: TSizes.spaceBtwItems),

                      //Divider
                      Divider(),
                      SizedBox(height: TSizes.spaceBtwItems),

                      //Payment Section
                      TBillingPaymentSection(),
                      SizedBox(height: TSizes.spaceBtwItems),

                      //Address Section
                      TBillingAddressSection(),
                      SizedBox(height: TSizes.spaceBtwItems)
                    ],
                  ),
                )
              ],
            )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                image: TImages.successfulPaymentIcon,
                title: 'Payment Success!',
                subTitle: 'Your item will be shipped soon!',
                onPressed: () => Get.offAll(() => const NavigationMenu()))),
            child: const Text('Checkout \$256.0')),
      ),
    );
  }
}

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //SubTotal
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
          Text('\$256', style: Theme.of(context).textTheme.bodyMedium),
        ]),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        //Shipping Fee
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
          Text('\$6.0', style: Theme.of(context).textTheme.labelLarge),
        ]),

        const SizedBox(height: TSizes.spaceBtwItems / 2),

        //Tax Fee
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
          Text('\$6.0', style: Theme.of(context).textTheme.labelLarge),
        ]),

        const SizedBox(height: TSizes.spaceBtwItems / 2),

        //Order Total
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
          Text('\$6.0', style: Theme.of(context).textTheme.titleMedium),
        ]),
      ],
    );
  }
}

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
            title: 'Shipping Address', buttonTitle: 'Change', onPressed: () {}),
        Text('Nikhil Mishra', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text('(+91)-798-123-5643',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              'South Liana, Maine 87659m USA',
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            ),
          ],
        ),
      ],
    );
  }
}

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(children: [
      TSectionHeading(
          title: 'Payment Method', buttonTitle: 'Change', onPressed: () {}),
      const SizedBox(height: TSizes.spaceBtwItems / 2),
      Row(
        children: [
          TRoundedContainer(
            width: 60,
            height: 35,
            backgroundColor: dark ? TColors.light : TColors.white,
            padding: const EdgeInsets.all(TSizes.sm),
            child: const Image(
                image: AssetImage(TImages.paypal), fit: BoxFit.contain),
          ), // TRoundedContainer
          const SizedBox(width: TSizes.spaceBtwItems / 2),
          Text('Paypal', style: Theme.of(context).textTheme.bodyLarge),
        ],
      )
    ]);
  }
}

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(
          top: TSizes.sm, bottom: TSizes.sm, right: TSizes.sm, left: TSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Have a promo code? Enter here',
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none),
            ),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  foregroundColor: dark
                      ? TColors.white.withOpacity(0.5)
                      : TColors.dark.withOpacity(0.5),
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  side: BorderSide(color: Colors.grey.withOpacity(0.1))),
              child: const Text('Apply'),
            ),
          )
        ],
      ),
    );
  }
}
