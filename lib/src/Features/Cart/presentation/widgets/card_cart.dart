import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/Constants/Decorations/app_Insets.dart';
import 'package:flutter_base/src/Core/Styles/Colors/app_colors.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter_base/src/Features/Cart/domain/entities/cart_e.dart';
import 'package:flutter_base/src/Features/Home/domain/entities/productE.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Image/generic_image/generic_image.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/cart_product_e.dart';
import '../manager/calculate_amount_controller.dart';
import 'com_cart_counter.dart';

class CardCart extends StatelessWidget {
  final CartProductE cart;

  const CardCart({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    final cubit = CalculateAmountController.getInstance(context);
    return BlocBuilder<CalculateAmountController, int>(
      builder: (context, state) {
        return Container(
          padding: AppInsets.defaultScreenALL,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18.toRad()),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  ImageGeneric.network(
                    url: "",
                    options: ImageOptions(
                        width: 80,
                        height: 80,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ],
              ),
              12.ESW(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      "Xiamo ",
                      fontSize: 12,
                    ),
                    4.ESH(),
                    const CustomText(
                      "\$ 500",
                      fontWeight: FW.semiBold,
                    ),
                    8.ESH(),
                    ComCartCounter(
                      product: cart,
                      onDecrement: cubit.onDecrementAmount,
                      onIncreament: cubit.onIncreamentAmount,
                      onRemove: (p) {},
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  CustomText(
                    "L",
                    fontSize: 14,
                    fontWeight: FW.semiBold,
                    color: AppColors.get.subTitle,
                  ),
                  20.ESH(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
