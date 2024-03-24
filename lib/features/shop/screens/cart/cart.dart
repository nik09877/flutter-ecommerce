import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/product_cards/product_card_vertical.dart';
import 'package:e_mart/common/widgets/products/cart/add_remove_button.dart';
import 'package:e_mart/common/widgets/products/cart/cart_item.dart';
import 'package:e_mart/features/shop/screens/checkout/checkout.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: const Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: TCartItems(
            showAddRemoveButtons: true,
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: const Text('Checkout \$256.0')),
      ),
    );
  }
}

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    required this.showAddRemoveButtons,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) => Column(
              children: [
                const TCartItem(),
                if (showAddRemoveButtons)
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                if (showAddRemoveButtons)
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 70),
                          TProductQuantityAddRemoveButton(),
                        ],
                      ),
                      TProductPriceText(price: '256')
                    ],
                  ),
              ],
            ),
        separatorBuilder: (_, __) =>
            const SizedBox(height: TSizes.spaceBtwSections),
        itemCount: 4);
  }
}
