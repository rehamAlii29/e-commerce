import 'package:flutter/cupertino.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter_base/src/Features/Cart/domain/entities/cart_product_e.dart';
import 'package:flutter_base/src/Features/Cart/presentation/widgets/card_cart.dart';
import 'package:flutter_base/src/Features/Home/data/models/product_model.dart';

class ListCardCart extends StatelessWidget {
  final List<CartProductE> cartProduct;

  const ListCardCart({
    super.key,
    required this.cartProduct,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => CardCart(cart: cartProduct[index]),
        separatorBuilder: (context, index) => 16.ESH(),
        itemCount: cartProduct.length);
  }
}
