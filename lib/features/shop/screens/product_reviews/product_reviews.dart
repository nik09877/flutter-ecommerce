import 'package:e_mart/common/widgets/appbar/appbar.dart';
import 'package:e_mart/features/shop/controllers/review_controller.dart';
import 'package:e_mart/features/shop/models/review_model.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/device/device_utility.dart';
import 'package:e_mart/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key, required this.productId});
  final int productId;
  @override
  Widget build(BuildContext context) {
    final reviewController = Get.put(ReviewController(productId: productId));
    return Scaffold(
      // APPBAR
      appBar: const TAppBar(
        title: Text('Reviews'),
        // title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),

      // BODY
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Reviews are verified and are from people who use the same type of device that you use.'),
              // const SizedBox(height: TSizes.spaceBtwItems),

              //Overall Product Ratings
              // const TOverallProductRating(),
              // const TRatingBarIndicator(
              //   rating: 4.5,
              // ),
              // Text("12,611", style: Theme.of(context).textTheme.bodySmall),
              Obx(() => reviewController.reviews.isNotEmpty
                  ? const SizedBox(height: TSizes.spaceBtwSections)
                  : const SizedBox()),

              //USER REVIEW CARD
              Obx(
                () => ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: reviewController.reviews.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) =>
                      UserReviewCard(review: reviewController.reviews[index]),
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: TSizes.spaceBtwSections),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              //ADD REVIEW
              Form(
                  key: reviewController.reviewFormKey,
                  child: Column(
                    children: [
                      //username
                      TextFormField(
                        maxLines: null,
                        validator: (value) =>
                            TValidator.validateEmptyText('Review', value),
                        // initialValue: user.value.username,
                        controller: reviewController.review,
                        expands: false,
                        decoration: const InputDecoration(
                            labelText: 'Give a review',
                            prefixIcon: Icon(Iconsax.user_edit)),
                      ),

                      const SizedBox(height: TSizes.spaceBtwSections),
                      //BUTTONS
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                reviewController.createReview(productId);
                                reviewController.review.text = "";
                              },
                              child: const Text('Send'))),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key, required this.review});
  final ReviewModel review;
  @override
  Widget build(BuildContext context) {
    final image = review.profileImage.isNotEmpty
        ? NetworkImage(review.profileImage)
        : const AssetImage(TImages.user) as ImageProvider;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              CircleAvatar(
                backgroundImage: image,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(review.userName,
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 2),
                  Text(review.date,
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ]),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        // const SizedBox(height: TSizes.spaceBtwItems),

        //REVIEW
        // Row(
        //   children: [
        //     const TRatingBarIndicator(rating: 4),
        //     const SizedBox(width: TSizes.spaceBtwItems),
        //     Text(review.date, style: Theme.of(context).textTheme.bodyMedium),
        //   ],
        // ),

        const SizedBox(height: TSizes.spaceBtwItems),
        ReadMoreText(
          review.review,
          trimLines: 2,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          trimMode: TrimMode.Line,
          moreStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),

        // const SizedBox(height: TSizes.spaceBtwItems),
        //Company Review
        // TRoundedContainer(
        //   backgroundColor: dark ? TColors.darkGrey : TColors.grey,
        //   child: Padding(
        //       padding: const EdgeInsets.all(TSizes.md),
        //       child: Column(
        //         children: [
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Text("E Mart",
        //                   style: Theme.of(context).textTheme.titleMedium),
        //               Text("02 Nov, 2023",
        //                   style: Theme.of(context).textTheme.bodyMedium),
        //             ],
        //           ),
        //           const SizedBox(height: TSizes.spaceBtwItems),
        //           const ReadMoreText(
        //             'The user interface of the app is quite nice. I was able to navigate and make purchases seamlessly. Great job!',
        //             trimLines: 2,
        //             trimExpandedText: ' show less',
        //             trimCollapsedText: ' show more',
        //             trimMode: TrimMode.Line,
        //             moreStyle: TextStyle(
        //                 fontSize: 14,
        //                 fontWeight: FontWeight.bold,
        //                 color: TColors.primary),
        //             lessStyle: TextStyle(
        //                 fontSize: 14,
        //                 fontWeight: FontWeight.bold,
        //                 color: TColors.primary),
        //           ),
        //         ],
        //       )),
        // ),
        // const SizedBox(
        //   height: TSizes.spaceBtwSections,
        // )
      ],
    );
  }
}

class TOverallProductRating extends StatelessWidget {
  const TOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.8',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgressIndicator(text: '5', value: 1.0),
              TRatingProgressIndicator(text: '4', value: 0.8),
              TRatingProgressIndicator(text: '3', value: 0.6),
              TRatingProgressIndicator(text: '2', value: 0.4),
              TRatingProgressIndicator(text: '1', value: 0.2),
            ],
          ),
        )
      ],
    );
  }
}

class TRatingProgressIndicator extends StatelessWidget {
  const TRatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 1,
        child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
      ),
      Expanded(
        flex: 11,
        child: SizedBox(
          width: TDeviceUtils.getScreenWidth(context) * 0.8,
          child: LinearProgressIndicator(
            value: value,
            minHeight: 11,
            backgroundColor: TColors.grey,
            borderRadius: BorderRadius.circular(7),
            valueColor: const AlwaysStoppedAnimation(TColors.primary),
          ),
        ),
      )
    ]);
  }
}
