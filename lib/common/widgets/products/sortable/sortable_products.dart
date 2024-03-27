import 'package:e_mart/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_mart/common/widgets/layouts/grid_layout.dart';
import 'package:e_mart/common/widgets/product_cards/product_card_vertical.dart';
import 'package:e_mart/features/shop/controllers/product_controller.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());

    return Obx(
      () => Column(
        children: [
          const TSearchContainer(
            text: 'Search in Store',
            showBorder: true,
            showBackground: false,
            padding: EdgeInsets.zero,
            showSearchField: true,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          DropdownButtonFormField(
              decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
              items: ['Name', 'Higher Price', 'Lower Price', 'Popularity']
                  .map((option) {
                return DropdownMenuItem(value: option, child: Text(option));
              }).toList(),
              onChanged: (value) {
                productController.sortFilter.value = value!;
                productController.filterProducts();
              }),
          const SizedBox(height: TSizes.spaceBtwSections),

          //Products
          TGridLayout(
            itemCount: productController.filteredProducts.length,
            itemBuilder: (_, index) => TProductCardVertical(
                product: productController.filteredProducts[index]),
          )
        ],
      ),
    );
  }
}
