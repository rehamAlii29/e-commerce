import 'package:flutter_base/src/Features/Cart/domain/entities/cart_product_e.dart';

class CartProductModel extends CartProductE {
  CartProductModel({required super.productId, required super.quantity});

  factory CartProductModel.fromJson(Map<String, dynamic> fromJson) {
    return CartProductModel(
      productId: fromJson['productId'],
      quantity: fromJson['quantity'],
    );
  }
}
