import 'package:flutter_base/src/Features/Cart/data/models/cart_model.dart';
import 'package:flutter_base/src/Features/Cart/domain/entities/cart_e.dart';
import 'package:flutter_base/src/Features/Home/domain/entities/productE.dart';

import '../../../../Core/NetworkStructure/DataSource/service_interface.dart';
import '../../../../Core/NetworkStructure/Repository/repo_interface.dart';
import '../../data/data_sources/fetch_cart_srvice.dart';

class FetchCartRepo extends RepoInterface<List<CartE>> {
  FetchCartRepo._();

  static final instance = FetchCartRepo._();

  @override
  ServicesInterface get serviceInstance => FetchCartService.instance;

  @override
  List<CartE> Function(dynamic data) get onParse => (data) {
        return data.map<CartE>((item) => CartModel.fromJson(item)).toList();
      };

  @override
  HasKeys get hasKeys => HasKeys.noKeys;
}
