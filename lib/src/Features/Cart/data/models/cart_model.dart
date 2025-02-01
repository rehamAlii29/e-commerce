import 'package:flutter_base/src/Features/Cart/domain/entities/cart_e.dart';

import '../../../Home/data/models/product_model.dart';
import '../../domain/entities/cart_product_e.dart';
import 'cart_product_model.dart';

class CartModel extends CartE {
  CartModel({
    super.date,
    super.id,
    super.products,
    super.userId,
  });

  factory CartModel.fromJson(Map<String, dynamic> fromJson) {
    return CartModel(
      id: fromJson['id'],
      userId: fromJson['userId'],
      date: fromJson['date'],
      products: (fromJson['products'] as List<dynamic>)
          .map((item) => CartProductModel.fromJson(item))
          .toList(),
    );
  }
}
