import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/Services/NavigatorService/navigator_service.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter_base/src/Features/Home/domain/entities/productE.dart';
import 'package:flutter_base/src/Features/ProductDetails/presentation/widgets/button_icon.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

import '../../../../Core/Constants/Navigation/navigation_cons.dart';
import '../../../../Core/Styles/Colors/app_colors.dart';

class CardDetails extends StatelessWidget {
  final ProductE product;

  const CardDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  "Sub total",
                  color: AppColors.get.subTitle,
                  fontSize: 12,
                ),
                5.ESH(),
                CustomText(
                  "\$ ${product.price}",
                  fontWeight: FW.semiBold,
                  fontSize: 24,
                ),
              ],
            ),
            ButtonIcon(
              width: 140,
              onTap: () {
                NavigatorService().to(cartPage, argument: product);
              },
              title: "Continue",
            )
          ],
        ),
        20.ESH(),
        CustomText(
          product.description ?? "",
        ),
      ],
    );
  }
}
