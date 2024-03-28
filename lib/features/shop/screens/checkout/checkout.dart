import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:e_mart/common/widgets/text/section_heading.dart';
import 'package:e_mart/features/personalization/controllers/address_controller.dart';
import 'package:e_mart/features/personalization/screens/address/add_new_address.dart';
import 'package:e_mart/features/personalization/screens/address/address.dart';
import 'package:e_mart/features/shop/controllers/cart_controller.dart';
import 'package:e_mart/features/shop/screens/cart/cart.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/formatters/formatter.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());

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
            onPressed: cartController.checkout,
            child: Obx(() => Text(
                'Checkout ₹${cartController.cartTotalPrice.toStringAsFixed(2)}'))),
      ),
    );
  }
}

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return Column(
      children: [
        //SubTotal
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
          Obx(() => Text('₹${cartController.cartTotalPrice.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.bodyMedium)),
        ]),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        //Shipping Fee
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
          Text('₹50.0',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(decoration: TextDecoration.lineThrough)),
        ]),

        const SizedBox(height: TSizes.spaceBtwItems / 2),

        //Tax Fee
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
          Text('₹60.0',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(decoration: TextDecoration.lineThrough)),
        ]),

        const SizedBox(height: TSizes.spaceBtwItems / 2),

        //Order Total
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
          Obx(
            () => Text('₹${cartController.cartTotalPrice.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleMedium),
          ),
        ]),
      ],
    );
  }
}

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addrController = Get.put(AddressController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => TSectionHeading(
              title: 'Shipping Address',
              buttonTitle: addrController.selectedAddressId.value != 0
                  ? 'Change'
                  : 'Add',
              onPressed: () {
                addrController.selectedAddressId.value != 0
                    ? Get.to(() => const AddressScreen())
                    : Get.to(() => const AddNewAddress());
              }),
        ),
        Obx(() {
          if (addrController.selectedAddressId.value != 0) {
            final name = addrController.addresses
                .firstWhere(
                    (addr) => addr.id == addrController.selectedAddressId.value)
                .name;

            return Text('$name', style: Theme.of(context).textTheme.bodyLarge);
          }
          return const SizedBox();
        }),
        Obx(() {
          if (addrController.selectedAddressId.value != 0) {
            return const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            );
          }
          return const SizedBox();
        }),
        Obx(() {
          if (addrController.selectedAddressId.value != 0) {
            final phone = addrController.addresses
                .firstWhere(
                    (addr) => addr.id == addrController.selectedAddressId.value)
                .phoneNumber;
            return Row(
              children: [
                const Icon(Icons.phone, color: Colors.grey, size: 16),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(TFormatter.formatPhoneNumber(phone!),
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            );
          }
          return const SizedBox();
        }),
        Obx(() {
          if (addrController.selectedAddressId.value != 0) {
            return const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            );
          }
          return const SizedBox();
        }),
        Obx(() {
          if (addrController.selectedAddressId.value != 0) {
            final address = addrController.addresses.firstWhere(
                (addr) => addr.id == addrController.selectedAddressId.value);

            return Row(
              children: [
                const Icon(Icons.location_history,
                    color: Colors.grey, size: 16),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Expanded(
                  child: Text(
                    '${address.street}, ${address.postalCode}, ${address.district}, ${address.state}, India',
                    style: Theme.of(context).textTheme.bodyMedium,
                    softWrap: true,
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        }),
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
                image: AssetImage(TImages.paytm), fit: BoxFit.contain),
          ), // TRoundedContainer
          const SizedBox(width: TSizes.spaceBtwItems / 2),
          Text('Paytm', style: Theme.of(context).textTheme.bodyLarge),
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
