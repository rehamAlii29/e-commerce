import 'package:flutter_base/src/Features/Cart/data/models/cart_model.dart';
import 'package:flutter_base/src/Features/Cart/domain/entities/cart_e.dart';
import 'package:flutter_base/src/Features/Home/domain/entities/productE.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Repository/repo_interface.dart';
import '../../../Home/data/models/product_model.dart';
import '../../data/data_sources/fetch_categories_service.dart';
import '../../data/data_sources/fetch_product_by_category_service.dart';

class FetchProductByCategoryRepo extends RepoInterface<List<ProductE>> {
  FetchProductByCategoryRepo._();

  static final instance = FetchProductByCategoryRepo._();

  @override
  ServicesInterface get serviceInstance =>
      FetchProductByCategoryService.instance;

  @override
  List<ProductE> Function(dynamic data) get onParse => (data) {
        return data
            .map<ProductE>((item) => ProductModel.fromJson(item))
            .toList();
      };

  @override
  HasKeys get hasKeys => HasKeys.noKeys;
}
