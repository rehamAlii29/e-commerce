import 'package:flutter_base/src/Features/Home/domain/entities/productE.dart';

import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Super/UseCase/user_case.dart';
import '../repo/fetch_product_repo.dart';

class FetchAllProductsUseCase extends UseCase<List<ProductE>, void> {
  @override
  Future<DataState<List<ProductE>>>? call({void params}) {
    return FetchProductRepo.instance.call();
  }
}
