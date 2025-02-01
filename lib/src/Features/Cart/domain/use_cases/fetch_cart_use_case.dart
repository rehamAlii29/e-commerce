import 'package:flutter_base/src/Features/Cart/domain/entities/cart_e.dart';
import 'package:flutter_base/src/Features/Home/domain/entities/productE.dart';

import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Super/UseCase/user_case.dart';
import '../../Core/user_id_query_params.dart';
import '../repositories/fetch_cart_repo.dart';

class FetchCartUseCase extends UseCase<List<CartE>, UserIdQueryParams> {
  @override
  Future<DataState<List<CartE>>>? call({UserIdQueryParams? params}) {
    return FetchCartRepo.instance.call(params: params);
  }
}
