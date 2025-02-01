import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base/src/Core/Constants/Decorations/app_Insets.dart';
import 'package:flutter_base/src/Core/Services/Bloc_Service/state_interface.dart';
import 'package:flutter_base/src/Core/Services/NavigatorService/navigator_service.dart';
import 'package:flutter_base/src/Core/Styles/Colors/app_colors.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter_base/src/Features/Cart/presentation/widgets/list_card_cart.dart';
import 'package:flutter_base/src/Features/ProductDetails/presentation/widgets/button_icon.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/calculate_amount_controller.dart';
import '../manager/fetch_cart_controller.dart';
import '../widgets/card_total_pricing.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CalculateAmountController(),
        ),
        BlocProvider(
          create: (context) => FetchCartController()..fetchCart(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const CustomText(
            "Cart",
            fontSize: 16,
            fontWeight: FW.semiBold,
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                NavigatorService().back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
              )),
        ),
        backgroundColor: AppColors.get.scaffoldColor,
        body: Padding(
          padding: AppInsets.defaultScreenALL,
          child: Column(
            children: [
              BlocBuilder<FetchCartController, StateInterface>(
                builder: (context, state) {
                  final cubit = FetchCartController.getInstance(context);

                  return cubit.cart.isEmpty
                      ? const CircularProgressIndicator()
                      : Expanded(
                          child: ListCardCart(
                            cartProduct: cubit.cart,
                          ),
                        );
                },
              ),
              const CardTotalPricing(),
              16.ESH(),
              ButtonIcon(
                  title: "Check Out", onTap: () {}, width: double.infinity)
            ],
          ),
        ),
      ),
    );
  }
}
