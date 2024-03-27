// import 'dart:convert';
import 'package:e_mart/dummy_data.dart';
import 'package:e_mart/features/shop/models/product_model.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  //observables
  RxList<ProductModel> products = <ProductModel>[].obs;

  //variables

  @override
  void onInit() {
    super.onInit();
    getAllProducts();
  }

  Future getAllProducts() async {
    try {
      // final response =
      //     await http.get(Uri.parse('https://fakestoreapi.com/products'));
      // if (response.statusCode == 200) {
      // List<dynamic> data = jsonDecode(response.body);
      products.assignAll(dummyProducts);
      // products.assignAll(
      // data.map((json) => ProductModel.fromJson(json)).toList());
      // } else {
      // products([]);
      // }
    } catch (e) {
      products([]);
    }
  }

  ProductModel findProductById(int id) {
    for (ProductModel product in products) {
      if (product.id == id) {
        return product;
      }
    }
    return const ProductModel();
  }
}
