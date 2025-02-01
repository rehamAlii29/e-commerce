import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter_base/src/Features/Cart/domain/entities/cart_product_e.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

import 'card_counter.dart';

class ComCartCounter extends StatelessWidget {
  final Function(CartProductE) onIncreament;
  final Function(CartProductE) onDecrement;
  final Function(CartProductE) onRemove;

  final CartProductE product;

  const ComCartCounter({
    required this.onIncreament,
    required this.onDecrement,
    required this.onRemove,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CardCounter(
          onTap: () {
            onIncreament(product);
          },
          icon: Icons.add,
        ),
        12.ESW(),
        CustomText(
          "${product.quantity}",
          fontWeight: FW.semiBold,
          fontSize: 16,
        ),
        12.ESW(),
        CardCounter(
          onTap: () {
            onDecrement(product);
          },
          icon: Icons.remove,
        ),
      ],
    );
  }
}
