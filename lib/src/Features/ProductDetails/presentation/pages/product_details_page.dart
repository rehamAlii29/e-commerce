import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/Features/Home/domain/entities/productE.dart';

import '../widgets/draggable_product_sheet.dart';
import '../widgets/page_view_product_image.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductE product;

  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    DraggableScrollableController controller = DraggableScrollableController();

    return Scaffold(
      body: Stack(
        children: [
          PageViewProductImage(
            images: [product.image ?? ""],
            controller: controller,
          ),
          DraggableProductSheet(
            product: product,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
