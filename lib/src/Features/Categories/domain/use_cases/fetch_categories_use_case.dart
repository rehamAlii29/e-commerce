import 'package:flutter_base/src/Features/Home/domain/entities/productE.dart';

import '../../../../Core/NetworkStructure/Resources/DataState/data_state.dart';
import '../../../../Super/UseCase/user_case.dart';
import '../repositories/fetch_categories_repo.dart';

class FetchCategoriesUseCase extends UseCase<List<String>, void> {
  @override
  Future<DataState<List<String>>>? call({void params}) {
    return FetchCategoriesRepo.instance.call();
  }
}
