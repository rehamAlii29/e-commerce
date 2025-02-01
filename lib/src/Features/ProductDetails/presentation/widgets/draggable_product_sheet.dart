import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/Styles/Colors/app_colors.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter_base/src/Features/Home/domain/entities/productE.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Buttons/Basic/custom_rounded_button.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

import 'card_details.dart';

class DraggableProductSheet extends StatelessWidget {
  ProductE product;
  DraggableScrollableController controller;

  DraggableProductSheet({
    super.key,
    required this.product,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.14,
      minChildSize: 0.14,
      maxChildSize: 0.6,
      controller: controller,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
              controller: scrollController,
              child: CardDetails(
                product: product,
              )),
        );
      },
    );
  }
}
