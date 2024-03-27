// import 'dart:convert';
import 'package:e_mart/dummy_data.dart';
import 'package:e_mart/features/shop/models/product_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  //observables
  RxList<ProductModel> products = <ProductModel>[].obs;
  RxList<ProductModel> filteredProducts = <ProductModel>[].obs;
  Rx<String> sortFilter = "".obs;

  //variables
  final search = TextEditingController();

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
      filterProducts();
      // products.assignAll(
      // data.map((json) => ProductModel.fromJson(json)).toList());
      // } else {
      // products([]);
      // }
    } catch (e) {
      products([]);
    }
  }

  void filterProducts() {
    filteredProducts.value = products
        .where((p) =>
            p.title!.toLowerCase().contains(search.text) ||
            p.category!.toLowerCase().contains(search.text))
        .toList();

    filteredProducts.sort((a, b) {
      // Sorting based on selected criteria
      switch (sortFilter.value) {
        case 'Name':
          return a.title!.compareTo(
              b.title!); // Assuming 'title' is the property to sort by
        case 'Higher Price':
          return b.price!.compareTo(
              a.price!); // Assuming 'price' is the property to sort by
        case 'Lower Price':
          return a.price!.compareTo(
              b.price!); // Assuming 'price' is the property to sort by
        case 'Popularity':
          return b.rating!.rate!.compareTo(a.rating!
              .rate!); // Assuming 'popularity' is the property to sort by
        default:
          return 0; // Default to no sorting
      }
    });
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
