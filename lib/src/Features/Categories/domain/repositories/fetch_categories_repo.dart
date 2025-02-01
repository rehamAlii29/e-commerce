import 'package:flutter_base/src/Features/Cart/data/models/cart_model.dart';
import 'package:flutter_base/src/Features/Cart/domain/entities/cart_e.dart';
import 'package:flutter_base/src/Features/Home/domain/entities/productE.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Repository/repo_interface.dart';
import '../../data/data_sources/fetch_categories_service.dart';

class FetchCategoriesRepo extends RepoInterface<List<String>> {
  FetchCategoriesRepo._();

  static final instance = FetchCategoriesRepo._();

  @override
  ServicesInterface get serviceInstance => FetchCategoriesService.instance;

  @override
  List<String> Function(dynamic data) get onParse => (data) {
        return List.from(data);
      };

  @override
  HasKeys get hasKeys => HasKeys.noKeys;
}
