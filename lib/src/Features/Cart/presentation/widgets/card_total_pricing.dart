import 'package:flutter/cupertino.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';

import 'card_item_pricing.dart';
import 'divider_dashed.dart';

class CardTotalPricing extends StatelessWidget {
  const CardTotalPricing({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CardItemPricing(
          title: "sub total",
          price: 80,
        ),
        16.ESH(),
        const CardItemPricing(
          title: "shipping",
          price: 5,
        ),
        const DiverDashed(),
        const CardItemPricing(
          title: "total",
          price: 500,
        ),
      ],
    );
  }
}
