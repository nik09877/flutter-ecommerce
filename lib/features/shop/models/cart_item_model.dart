import 'package:e_mart/features/shop/models/product_model.dart';

class CartItemModel {
  final ProductModel product;
  final int count;

  const CartItemModel({required this.product, this.count = 1});
}
