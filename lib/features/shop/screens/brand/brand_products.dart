import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/brands/brand_card.dart';
import 'package:e_mart/common/widgets/products/sortable/sortable_products.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: TAppBar(
          title: Text('Nike'),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    TBrandCard(showBorder: true),
                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    TSortableProducts()
                  ],
                ))));
  }
}
