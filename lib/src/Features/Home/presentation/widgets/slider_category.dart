import 'package:flutter/cupertino.dart';
import 'package:flutter_base/src/Core/Services/Bloc_Service/data_render_builder.dart';
import 'package:flutter_base/src/Core/Utils/Extensions/screen_spaces_extension.dart';
import 'package:flutter_base/src/Features/Categories/presentation/manager/fetch_categories_controller.dart';
import 'package:flutter_base/src/Features/Home/data/models/category_model.dart';
import 'package:flutter_base/src/Features/Home/presentation/widgets/card_category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/categoryE.dart';
import '../../../Categories/presentation/manager/choose_category_controller.dart';

class SliderCategory extends StatelessWidget {
  const SliderCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataRenderBuilder<List<String>, FetchCategoriesController>(
        cubit: FetchCategoriesController()..fetchCategories(),
        loadingWidget: 0.ESH(),
        successBuilder: (data) => SizedBox(
              height: 32.toH(),
              child: ListView.separated(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      BlocBuilder<ChooseCategoryController, String>(
                        builder: (context, state) {
                          return CardCategory(
                            category: data[index],
                            selected: BlocProvider.of<ChooseCategoryController>(
                                        context)
                                    .selectedCategory ==
                                data[index],
                            onSelect: (cat) =>
                                BlocProvider.of<ChooseCategoryController>(
                                        context)
                                    .onSelectCategory(data[index]),
                          );
                        },
                      ),
                  separatorBuilder: (context, index) => 16.ESW(),
                  itemCount: data.length),
            ));
  }
}
