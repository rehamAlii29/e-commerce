import 'package:flutter/cupertino.dart';
import 'package:flutter_base/src/Features/Home/domain/entities/productE.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/cart_product_e.dart';

class CalculateAmountController extends Cubit<int> {
  CalculateAmountController() : super(1);

  void onIncreamentAmount(CartProductE product) {
    product.quantity = product.quantity + 1;
    emit(product.quantity);
  }

  static CalculateAmountController getInstance(BuildContext context) =>
      BlocProvider.of<CalculateAmountController>(context);

  void onDecrementAmount(CartProductE product) {
    if (product.quantity > 0) {
      product.quantity = product.quantity - 1;
      emit(product.quantity);
    }
  }
}
