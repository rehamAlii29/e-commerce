import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter_base/src/Features/Home/domain/entities/productE.dart';
import 'package:flutter_base/src/Features/Home/presentation/widgets/image_product.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Image/generic_image/generic_image.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';

import '../../../../Core/Constants/Navigation/navigation_cons.dart';
import '../../../../Core/Constants/Strings/assets.dart';
import '../../../../Core/Services/NavigatorService/navigator_service.dart';
import '../../../ProductDetails/presentation/widgets/card_icon.dart';

class CardProduct extends StatelessWidget {
  final ProductE product;

  const CardProduct({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigatorService().to(productDetailsPage, argument: product);
      },
      child: Container(
        width: 160.toW(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ImageProduct(
                  image: product.image ?? "",
                ),
                Padding(
                  padding: EdgeInsets.all(8.toRad()),
                  child: GestureDetector(
                    onTap: () {},
                    child: CardIcon(
                      width: 30,
                      height: 30,
                      icon: Assets.heart,
                      onTap: () {},
                      iconH: 18,
                      iconW: 18,
                    ),
                  ),
                ),
              ],
            ),
            10.ESH(),
            CustomText(
              product.title ?? "",
              fontSize: 12,
              maxLines: 1,
              isOverFlow: true,
            ),
            CustomText(
              " \$ ${product.price}  ",
              fontSize: 14,
              fontWeight: FW.semiBold,
              maxLines: 1,
              isOverFlow: true,
            ),
          ],
        ),
      ),
    );
  }
}
