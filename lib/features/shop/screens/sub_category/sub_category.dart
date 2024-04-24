// import 'package:e_mart/common/widgets/appbar/appbar.dart';
// import 'package:e_mart/common/widgets/images/rounded_image.dart';
// import 'package:e_mart/common/widgets/product_cards/product_card_horizontal.dart';
// import 'package:e_mart/common/widgets/text/section_heading.dart';
// import 'package:e_mart/utils/constants/image_strings.dart';
// import 'package:e_mart/utils/constants/sizes.dart';
// import 'package:flutter/material.dart';

// class SubCategoriesScreen extends StatelessWidget {
//   const SubCategoriesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const TAppBar(
//         title: Text('Sports shirts'),
//         showBackArrow: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//             padding: const EdgeInsets.all(TSizes.defaultSpace),
//             child: Column(
//               children: [
//                 //Banner
//                 const TRoundedImage(
//                   imageUrl: TImages.promoBanner3,
//                   width: double.infinity,
//                   applyImageRadius: true,
//                 ),
//                 const SizedBox(
//                   height: TSizes.spaceBtwSections,
//                 ),

//                 //Sub-Categories
//                 Column(
//                   children: [
//                     //Heading
//                     TSectionHeading(
//                       title: 'Sports shirts',
//                       onPressed: () {},
//                     ),
//                     const SizedBox(
//                       height: TSizes.spaceBtwItems / 2,
//                     ),

//                     SizedBox(
//                       height: 120,
//                       child: ListView.separated(
//                           itemCount: 5,
//                           scrollDirection: Axis.horizontal,
//                           separatorBuilder: (_, __) => const SizedBox(
//                                 width: TSizes.spaceBtwItems,
//                               ),
//                           itemBuilder: (_, index) =>
//                               const ProductCardHorizontal()),
//                     )
//                   ],
//                 )
//               ],
//             )),
//       ),
//     );
//   }
// }
