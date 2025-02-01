import 'package:flutter/cupertino.dart';
import 'package:flutter_base/src/Core/Styles/Colors/app_colors.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

class CardItemPricing extends StatelessWidget {
  final String title;
  final double price;

  const CardItemPricing({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          title,
          color: AppColors.get.subTitle,
        ),
        const Expanded(child: SizedBox()),
        CustomText(
          " \$ ${price}",
          fontSize: 16,
          fontWeight: FW.semiBold,
        ),
      ],
    );
  }
}
