import 'package:e_mart/features/shop/controllers/product_controller.dart';
import 'package:e_mart/features/shop/models/cart_item_model.dart';
import 'package:e_mart/features/shop/models/product_model.dart';
import 'package:e_mart/main.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  //observables
  RxList<CartItemModel> cart = <CartItemModel>[].obs;
  Rx<double> cartTotalPrice = 0.0.obs;
  Rx<int> cartCount = 0.obs;

  //variables
  final productController = Get.put(ProductController());
  final userId = supabase.auth.currentUser!.id;

  @override
  void onInit() {
    super.onInit();
    getAllCartItems();
  }

  void getAllCartItems() async {
    try {
      final data = await supabase.from('Cart').select().eq('userId', userId);
      await productController.getAllProducts();

      cart.value = data.map((e) {
        ProductModel prod = productController.products
            .firstWhere((prod) => prod.id == e["productId"]);
        // print("---------------------------------$prod----------------------");
        // print(
        // "---------------------------------Allprods ${productController.products}----------------------");
        return CartItemModel(product: prod, count: e["count"]);
      }).toList();

      calcCartCnt();
      calcCartPrice();
    } catch (e) {
      cart([]);
    }
  }

  void calcCartCnt() {
    cartCount.value = cart.length;
  }

  void calcCartPrice() {
    cartTotalPrice.value = cart.fold(
        0.0,
        (previousValue, element) =>
            previousValue + element.count * element.product.price!);
  }

  void addToCart(ProductModel prod) async {
    try {
      int cntofProd = productCountInCart(prod.id!);
      if (cntofProd == 0) {
        cart.add(CartItemModel(product: prod, count: 1));
      } else {
        cart.value = cart.map((item) {
          if (item.product.id == prod.id) {
            return CartItemModel(product: item.product, count: item.count + 1);
          }
          return item;
        }).toList();
      }
      calcCartCnt();
      calcCartPrice();
      await supabase.from('Cart').upsert(
          {'userId': userId, 'productId': prod.id, 'count': cntofProd + 1});
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  void removeFromCart(ProductModel prod) async {
    try {
      int cntofProd = productCountInCart(prod.id!);
      if (cntofProd == 0) return;
      if (cntofProd == 1) {
        cart.value = cart.where((e) => e.product.id != prod.id).toList();
        calcCartCnt();
        calcCartPrice();
        await supabase
            .from('Cart')
            .delete()
            .match({'userId': userId, 'productId': prod.id});
      } else {
        cart.value = cart.map((item) {
          if (item.product.id == prod.id) {
            return CartItemModel(product: item.product, count: item.count - 1);
          }
          return item;
        }).toList();
        calcCartCnt();
        calcCartPrice();
        await supabase.from('Cart').update({'count': cntofProd - 1}).match(
            {'userId': userId, 'productId': prod.id});
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  int productCountInCart(int id) {
    int cnt = 0;
    for (CartItemModel cartItem in cart) {
      if (cartItem.product.id == id) {
        cnt = cartItem.count;
        break;
      }
    }
    return cnt;
  }
}
