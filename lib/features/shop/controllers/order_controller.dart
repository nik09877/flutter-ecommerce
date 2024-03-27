import 'package:e_mart/features/shop/models/order_model.dart';
import 'package:e_mart/main.dart';
import 'package:e_mart/utils/formatters/formatter.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  //observables
  RxList<OrderModel> orders = <OrderModel>[].obs;

  //variables
  final userId = supabase.auth.currentUser!.id;

  @override
  void onInit() {
    super.onInit();
    getAllOrders();
  }

  void getAllOrders() async {
    try {
      final data = await supabase.from('Orders').select().eq('userId', userId);

      orders.value = data.map((e) {
        return OrderModel.fromJson(e);
      }).toList();
    } catch (e) {
      orders([]);
    }
  }

  Future createOrder(double cartTotalPrice) async {
    try {
      await supabase.from('Orders').insert({
        'userId': userId,
        'orderAmount': cartTotalPrice.toStringAsFixed(2),
        'orderDate': TFormatter.formatDate(DateTime.now()),
        'status': 'Processing'
      });
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
