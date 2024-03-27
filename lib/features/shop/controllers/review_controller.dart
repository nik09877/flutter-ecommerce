import 'package:e_mart/common/widgets/loaders/circular_loader.dart';
import 'package:e_mart/features/personalization/controllers/user_controller.dart';
import 'package:e_mart/features/shop/models/review_model.dart';
import 'package:e_mart/main.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/formatters/formatter.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController {
  static ReviewController get instance => Get.find();

  // ReviewController({required this.productId});

  //observables
  RxList<ReviewModel> reviews = <ReviewModel>[].obs;
  Rx<int> reviewCnt = 0.obs;

  //variables
  final userId = supabase.auth.currentUser!.id;
  final userController = Get.put(UserController());
  final review = TextEditingController();
  GlobalKey<FormState> reviewFormKey = GlobalKey<FormState>();
  // final int productId;

  // @override
  // void onInit() {
  // super.onInit();
  // Fetch reviews for the given product ID
  // getAllReviews();
  // }

  Future getAllReviews(int productId) async {
    try {
      final data =
          await supabase.from('Reviews').select().eq('productId', productId);

      reviews.value = data.map((e) {
        return ReviewModel.fromJson(e);
      }).toList();
      calcReviewCnt();
    } catch (e) {
      reviews([]);
    }
  }

  Future createReview(int productId) async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Sending your review...', TImages.docerAnimation);

      //Form Validation
      if (!reviewFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoadind();
        return;
      }

      Map<String, dynamic> json = {
        "userName": userController.user.value.fullName,
        "review": review.text.trim(),
        "profileImage": userController.user.value.profilePicture,
        "productId": productId,
        "date": TFormatter.formatDate(DateTime.now()),
      };
      final List<Map<String, dynamic>> data =
          await supabase.from('Reviews').insert(json).select();
      reviews.insert(0, ReviewModel.fromJson(data[0]));
      calcReviewCnt();

      //Show Success Message
      TFullScreenLoader.stopLoadind();
    } catch (e) {
      TFullScreenLoader.stopLoadind();
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  void calcReviewCnt() {
    reviewCnt.value = reviews.length;
  }
}
