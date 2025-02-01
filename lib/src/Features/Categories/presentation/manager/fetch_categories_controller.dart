import 'package:flutter_base/src/Core/Services/Bloc_Service/bloc_interface.dart';
import 'package:flutter_base/src/Core/Services/Bloc_Service/state_interface.dart';
import 'package:flutter_base/src/Core/Services/NetWorkManger/network_manger.dart';
import 'package:flutter_base/src/Features/Categories/domain/use_cases/fetch_categories_use_case.dart';

class FetchCategoriesController extends CubitInterface<List<String>> {
  fetchCategories() async {
    if (await NetworkManager.isConnected()) {
      setLoading();
      final FetchCategoriesUseCase useCase = FetchCategoriesUseCase();
      final data = await useCase();
      setSuccess(data!.data!);
    }
  }
}
