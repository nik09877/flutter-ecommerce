import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/product_cards/product_card_vertical.dart';
import 'package:e_mart/common/widgets/products/cart/add_remove_button.dart';
import 'package:e_mart/common/widgets/products/cart/cart_item.dart';
import 'package:e_mart/features/shop/controllers/cart_controller.dart';
import 'package:e_mart/features/shop/screens/checkout/checkout.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());

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
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ElevatedButton(
              onPressed: () => cartController.cartTotalPrice > 0
                  ? Get.to(() => const CheckoutScreen())
                  : null,
              child: Text(
                  'Checkout ₹${cartController.cartTotalPrice.toStringAsFixed(2)}')),
        ),
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
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
        itemCount: cartController.cart.length,
        shrinkWrap: true,
        itemBuilder: (_, index) => Column(
          children: [
            TCartItem(product: cartController.cart[index].product),
            if (showAddRemoveButtons)
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
            if (showAddRemoveButtons)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 70),
                      TProductQuantityAddRemoveButton(
                          product: cartController.cart[index].product),
                    ],
                  ),
                  TProductPriceText(
                      price: (((cartController.cartCount.value != -1
                                  ? cartController.productCountInCart(
                                      cartController.cart[index].product.id!)
                                  : 0)) *
                              cartController.cart[index].product.price!)
                          .toStringAsFixed(2)),
                ],
              ),
          ],
        ),
        separatorBuilder: (_, __) =>
            const SizedBox(height: TSizes.spaceBtwSections),
      ),
    );
  }
}
