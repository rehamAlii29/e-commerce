import 'package:equatable/equatable.dart';

class CartProductE extends Equatable {
  int productId;
  int quantity;

  CartProductE({required this.productId, required this.quantity});

  @override
  List<Object> get props => [productId, quantity];

  Map<String, dynamic> toMap() =>
      {'productId': productId, 'quantity': quantity};
}
