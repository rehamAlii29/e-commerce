import 'dart:async';
import 'dart:ui';
import 'package:flutter_base/src/Core/Services/NetWorkManger/network_manger.dart';
import 'package:flutter_base/src/Features/Home/data/models/product_model.dart';
import '../../../../Core/Constants/Storage/storage_cons.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_base/src/Core/Services/Bloc_Service/bloc_interface.dart';
import 'package:flutter_base/src/Core/Utils/general_utils.dart';
import 'package:flutter_base/src/Features/Home/domain/entities/productE.dart';
import 'package:flutter_base/src/Features/Home/domain/use_cases/fetch_products_use_case.dart';

import '../../../../Core/Services/HiveStorage/hive_service.dart';
import 'package:http/http.dart' as http;

class FetchProductController extends CubitInterface<List<ProductE>> {
  List<ProductE> cashedProduct = [];
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  FetchProductController() : super() {
    _init();
  }

  void _init() {
    getCashedProduct();
  }

  Future<void> getCashedProduct() async {
    printDM("greee");
    cashedProduct = await LocalStorageService.getList<ProductE>(
        fromMap: (e) => ProductModel.fromJson(e), key: cashedProductsC);
    printDM("greee");
    printDM("cashed ppp is $cashedProduct");
  }

  Future<void> fetchProducts() async {
    setLoading();
    if (await NetworkManager.isConnected()) {
      printDM("connected");
      await LocalStorageService.clearProducts();
      final FetchAllProductsUseCase useCase = FetchAllProductsUseCase();
      final data = await useCase();

      if (data != null && data.data!.isNotEmpty) {
        cashedProduct = data.data!;
        await LocalStorageService.saveList<ProductE>(
            toMap: (e) => e.toMap(),
            data: data.data ?? [],
            key: cashedProductsC);
        setSuccess(cashedProduct);
      } else {
        setFailure("No data available");
      }
    } else {
      setSuccess(cashedProduct);
    }
  }

  void _listenToConnectivity() {
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((connectivityResults) {
      if (connectivityResults.contains(ConnectivityResult.mobile) ||
          connectivityResults.contains(ConnectivityResult.wifi)) {
        fetchProducts();
      }
    });
  }
}
