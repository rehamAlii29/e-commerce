import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/Core/Services/Bloc_Service/data_render_builder.dart';
import 'package:flutter_base/src/Features/Home/domain/entities/productE.dart';
import 'package:flutter_base/src/Shared/Presentation/Widgets/GeneralWidgets/Text/custom_text_lib.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Shared/Presentation/Widgets/Illustrations/imports_illustrations.dart';
import '../../../Home/presentation/widgets/grid_card_product.dart';
import '../manager/fetch_product_by_category_controller.dart';

class CategoryProductsPage extends StatelessWidget {
  final String category;

  const CategoryProductsPage({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchProductByCategoryController(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CustomText(
            category,
            fontWeight: FW.bold,
          ),
        ),
        body:
            DataRenderBuilder<List<ProductE>, FetchProductByCategoryController>(
          cubit: FetchProductByCategoryController()
            ..fetchProductByCategory(category),
          successBuilder: (data) => GridCardProduct(
            scrollPhysics: const BouncingScrollPhysics(),
            data: data,
          ),
          failureBuilder: (error) => IllustrationSomethingWrongScreen(
            body: error,
          ),
        ),
      ),
    );
  }
}
