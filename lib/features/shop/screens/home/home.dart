import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_mart/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:e_mart/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:e_mart/common/widgets/images/rounded_image.dart';
import 'package:e_mart/common/widgets/layouts/grid_layout.dart';
import 'package:e_mart/common/widgets/product_cards/product_card_vertical.dart';
import 'package:e_mart/common/widgets/text/section_heading.dart';
import 'package:e_mart/features/shop/controllers/home_controller.dart';
import 'package:e_mart/features/shop/screens/all_products/all_products.dart';
import 'package:e_mart/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_mart/features/shop/screens/sub_category/sub_category.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //HEADER
            TPrimaryHeaderContainer(
              child: Column(children: [
                //APPBAR
                const THomeAppBar(),
                const SizedBox(height: TSizes.spaceBtwSections),

                //SEARCH BAR
                const TSearchContainer(text: 'Search in Store'),
                const SizedBox(height: TSizes.spaceBtwSections),

                //CUSTOM HEADING and LISTVIEW
                Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        const TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 6,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                return TVerticalImageText(
                                  image: TImages.shoeIcon,
                                  title: 'Shoes',
                                  onTap: () =>
                                      Get.to(() => const SubCategoriesScreen()),
                                );
                              }),
                        )
                      ],
                    )),

                const SizedBox(
                  height: TSizes.spaceBtwSections,
                )
              ]),
            ),

            //BODY
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  //HEADING
                  TSectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  //LAYOUT
                  TGridLayout(
                    itemCount: 2,
                    itemBuilder: (_, index) => const TProductCardVertical(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        CarouselSlider(
          items: const [
            TRoundedImage(imageUrl: TImages.promoBanner1),
            TRoundedImage(imageUrl: TImages.promoBanner2),
            TRoundedImage(imageUrl: TImages.promoBanner3),
          ],
          options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index)),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++)
                TCircularContainer(
                    width: 20,
                    height: 4,
                    backgroundColor: controller.carousalCurrentIndex.value == i
                        ? TColors.primary
                        : TColors.grey,
                    margin: const EdgeInsets.only(right: 10))
            ],
          ),
        )
      ],
    );
  }
}
