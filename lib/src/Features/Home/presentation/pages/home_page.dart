import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/Constants/Decorations/app_Insets.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter_base/src/Features/Base/presentation/widgets/imports_widgets_base.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Cart/presentation/manager/fetch_cart_controller.dart';
import '../manager/fetch_product_controller.dart';
import '../widgets/banner_home.dart';
import '../widgets/grid_card_product_builder.dart';
import '../widgets/search_bar_home.dart';
import '../widgets/slider_category.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FetchProductController>(context).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BaseAppBar(),
        body: Padding(
          padding: AppInsets.defaultScreenALL,
          child: ListView(
            children: [
              const SearchBarHome(),
              32.ESH(),
              const BannerHome(),
              16.ESH(),
              const SliderCategory(),
              16.ESH(),
              const GridCardProductBuilder(),
            ],
          ),
        ));
  }
}
