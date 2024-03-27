import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/brands/brand_card.dart';
import 'package:e_mart/common/widgets/layouts/grid_layout.dart';
import 'package:e_mart/common/widgets/text/section_heading.dart';
import 'package:e_mart/dummy_data.dart';
import 'package:e_mart/features/shop/screens/all_products/all_products.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Heading
              const TSectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              //Brands
              TGridLayout(
                  mainAxisExtent: 80,
                  itemCount: dummyBrands.length,
                  itemBuilder: (_, index) => TBrandCard(
                        showBorder: true,
                        title: dummyBrands[index]["name"],
                        image: dummyBrands[index]["image"],
                        prodCount: dummyBrands[index]["count"],
                        onTap: () => Get.to(() => const AllProducts()),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
