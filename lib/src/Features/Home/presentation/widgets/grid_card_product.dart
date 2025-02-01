import 'package:flutter/cupertino.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';

import '../../domain/entities/productE.dart';
import 'card_product.dart';

class GridCardProduct extends StatelessWidget {
  final List<ProductE> data;
  final ScrollPhysics? scrollPhysics;

  const GridCardProduct({
    super.key,
    required this.data,
    this.scrollPhysics,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: scrollPhysics ?? NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .6,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8.toH(),
        ),
        itemCount: data.length,
        itemBuilder: (context, index) => CardProduct(
              product: data[index],
            ));
  }
}
