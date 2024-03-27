import 'package:e_mart/features/shop/controllers/product_controller.dart';
import 'package:e_mart/features/shop/models/product_model.dart';
import 'package:e_mart/main.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  static WishlistController get instance => Get.find();

  //observables
  RxList<ProductModel> wishList = <ProductModel>[].obs;

  //variables
  final productController = Get.put(ProductController());
  final userId = supabase.auth.currentUser!.id;

  @override
  void onInit() {
    super.onInit();
    getAllWishlistItems();
  }

  void getAllWishlistItems() async {
    try {
      final data = await supabase
          .from('Wishlist')
          .select('productId')
          .eq('userId', userId);

      wishList.value = data.map((e) {
        return productController.findProductById(e["productId"]);
      }).toList();
    } catch (e) {
      wishList([]);
    }
  }

  void addToWishlist(ProductModel prod) async {
    try {
      wishList.add(prod);
      await supabase
          .from('Wishlist')
          .insert({'userId': userId, 'productId': prod.id});
      TLoaders.successSnackBar(
          title: "Yoohoo!", message: "Product added to wishlist");
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  void removeFromWishlist(ProductModel prod) async {
    try {
      wishList.remove(prod);
      await supabase
          .from('Wishlist')
          .delete()
          .match({'userId': userId, 'productId': prod.id});
      TLoaders.warningSnackBar(
          title: "Oh!", message: "Product removed from wishlist");
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  bool productInWishlist(int id) {
    bool found = false;
    for (ProductModel prod in wishList) {
      if (prod.id == id) {
        found = true;
        break;
      }
    }
    return found;
  }
}
