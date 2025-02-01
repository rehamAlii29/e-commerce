import 'package:flutter_base/src/Features/Home/domain/entities/productE.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Repository/repo_interface.dart';
import '../../data/data_sources/fetch_product_service.dart';
import '../../data/models/product_model.dart';

class FetchProductRepo extends RepoInterface<List<ProductE>> {
  FetchProductRepo._();

  static final instance = FetchProductRepo._();

  @override
  ServicesInterface get serviceInstance => FetchProductService.instance;

  @override
  List<ProductE> Function(dynamic data) get onParse => (data) {
        return data
            .map<ProductE>((item) => ProductModel.fromJson(item))
            .toList();
      };

  @override
  HasKeys get hasKeys => HasKeys.noKeys;
}
