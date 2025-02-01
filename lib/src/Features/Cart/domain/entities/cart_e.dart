import 'package:equatable/equatable.dart';

import 'cart_product_e.dart';

class CartE extends Equatable {
  final int? id;
  final int? userId;
  final String? date;
  final List<CartProductE>? products;

  CartE({this.id, this.userId, this.date, this.products});

  @override
  List<Object> get props => [id!, userId!, date!, products!];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'date': date,
      'products': products?.map((product) => product.toMap()).toList()
    };
  }
}
