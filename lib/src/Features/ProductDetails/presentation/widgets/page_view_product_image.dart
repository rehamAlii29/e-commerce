import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/Constants/Strings/assets.dart';
import 'package:flutter_base/src/Core/Styles/Colors/app_colors.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Image/generic_image/generic_image.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'header_product_details.dart';

class PageViewProductImage extends StatelessWidget {
  final List<String> images;
  DraggableScrollableController controller;

  PageViewProductImage(
      {super.key, required this.images, required this.controller});

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();

    return SizedBox(
      width: double.infinity,
      height: 700.toH(),
      child: Stack(
        children: [
          PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              itemBuilder: (context, index) => ImageGeneric.network(
                    url: images[index],
                    options: const ImageOptions(
                      fit: BoxFit.fill,
                      // width: double.infinity,
                    ),
                  )),
          GestureDetector(
            onVerticalDragStart: (d) {
              controller.animateTo(
                0.6,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOutSine,
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ImageGeneric.asset(
                  url: Assets.up,
                  options: const ImageOptions(
                    fit: BoxFit.cover,
                    width: 24,
                    height: 42,
                  ),
                ),
                5.ESH(),
                CustomText(
                  "Swipe up for details",
                  color: AppColors.get.white,
                  fontSize: 14,
                ),
                4.ESH(),
                Center(
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: images.length,
                    effect: const SlideEffect(
                      dotWidth: 8,
                      dotHeight: 8,
                      type: SlideType.normal,
                      paintStyle: PaintingStyle.stroke,
                      activeDotColor: Colors.white,
                      dotColor: Colors.grey,
                    ),
                  ),
                ),
                10.ESH()
              ],
            ),
          ),
          const HeaderProductDetails()
        ],
      ),
    );
  }
}
