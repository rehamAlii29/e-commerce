import 'package:flutter/material.dart';

import 'package:flutter_base/src/Features/Home/presentation/manager/home_controller.dart';
import 'package:flutter_base/src/Features/Home/presentation/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:flutter_base/src/Features/Base/presentation/widgets/imports_widgets_base.dart';

import '../../../Cart/presentation/manager/fetch_cart_controller.dart';
import '../../../Categories/presentation/manager/fetch_categories_controller.dart';
import '../../../Categories/presentation/manager/choose_category_controller.dart';
import '../../../Home/presentation/manager/fetch_product_controller.dart';
import '../manager/base_cubit.dart';

class BasePage extends StatelessWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return MultiBlocProvider(
      providers: [
        BlocProvider<ChooseCategoryController>(
          create: (context) => ChooseCategoryController(),
        ),
        BlocProvider<FetchProductController>(
          create: (context) => FetchProductController(),
        ),
        BlocProvider<FetchCartController>(
          create: (context) => FetchCartController(),
        ),
        BlocProvider<BaseCubit>(create: (context) => BaseCubit()),
        BlocProvider<FetchCategoriesController>(
            create: (context) => FetchCategoriesController())
      ],
      child: BlocBuilder<BaseCubit, int>(
        builder: (context, state) {
          final controller = BaseCubit.get(context);
          return Scaffold(
              appBar: null,
              bottomNavigationBar: const BaseBottomNavBar(),
              body: controller.pages[controller.currentIndex]);
        },
      ),
    );
  }
}
