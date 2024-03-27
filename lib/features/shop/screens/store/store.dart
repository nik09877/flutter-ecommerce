import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/common/widgets/appbar/tabbar.dart';
import 'package:e_mart/common/widgets/brands/brand_card.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_mart/common/widgets/layouts/grid_layout.dart';
import 'package:e_mart/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:e_mart/common/widgets/text/section_heading.dart';
import 'package:e_mart/dummy_data.dart';
import 'package:e_mart/features/shop/screens/all_products/all_products.dart';
import 'package:e_mart/features/shop/screens/brand/all_brands.dart';
import 'package:e_mart/features/shop/screens/cart/cart.dart';
import 'package:e_mart/features/shop/screens/store/widgets/category_tab.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title:
              Text("Store", style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            TCartCounterIcon(
              onPressed: () => Get.to(() => const CartScreen()),
            )
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    pinned: true,
                    floating: true,
                    backgroundColor: THelperFunctions.isDarkMode(context)
                        ? TColors.black
                        : TColors.white,
                    expandedHeight: 440,
                    automaticallyImplyLeading: false,
                    flexibleSpace: Padding(
                        padding: const EdgeInsets.all(TSizes.defaultSpace),
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            //SEARCH BAR
                            const SizedBox(height: TSizes.spaceBtwItems),
                            TSearchContainer(
                              text: 'Search in Store',
                              showBorder: true,
                              showBackground: false,
                              padding: EdgeInsets.zero,
                              onTap: () => Get.to(() => const AllProducts()),
                            ),
                            const SizedBox(height: TSizes.spaceBtwSections),

                            //FEATURED BRANDS
                            TSectionHeading(
                              title: 'Featured Brands',
                              onPressed: () =>
                                  Get.to(() => const AllBrandsScreen()),
                            ),
                            const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                            TGridLayout(
                                itemCount: dummyBrands.length,
                                mainAxisExtent: 80,
                                itemBuilder: (_, index) {
                                  return TBrandCard(
                                    showBorder: false,
                                    title: dummyBrands[index]["name"],
                                    image: dummyBrands[index]["image"],
                                    prodCount: dummyBrands[index]["count"],
                                    onTap: () =>
                                        Get.to(() => const AllProducts()),
                                  );
                                })
                          ],
                        )),

                    // TABS
                    bottom: const TTabBar(
                      tabs: [
                        Tab(child: Text('Sports')),
                        Tab(child: Text('Furniture')),
                        Tab(child: Text('Electronics')),
                        Tab(child: Text('Clothes')),
                        Tab(child: Text('Cosmetics')),
                      ],
                    ))
              ];
            },
            body: TabBarView(
                children: dummyCategories
                    .sublist(0, 5)
                    .map((item) => CategoryTab(
                          title: item["name"],
                        ))
                    .toList())),
      ),
    );
  }
}
