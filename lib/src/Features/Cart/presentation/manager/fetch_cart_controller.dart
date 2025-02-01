import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_base/src/Core/Services/Bloc_Service/bloc_interface.dart';
import 'package:flutter_base/src/Core/Services/Bloc_Service/state_interface.dart';
import 'package:flutter_base/src/Core/Utils/general_utils.dart';
import 'package:flutter_base/src/Features/Cart/Core/user_id_query_params.dart';
import 'package:flutter_base/src/Features/Cart/data/models/cart_model.dart';
import 'package:flutter_base/src/Features/Cart/domain/entities/cart_e.dart';
import 'package:flutter_base/src/Features/Cart/domain/entities/cart_product_e.dart';
import 'package:flutter_base/src/Features/Cart/domain/use_cases/fetch_cart_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../../Core/Constants/Storage/storage_cons.dart';
import '../../../../Core/Services/HiveStorage/hive_service.dart';
import '../../../../Core/Services/NetWorkManger/network_manger.dart';

class FetchCartController extends CubitInterface<List<CartE>> {
  List<CartProductE> cart = [];
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  FetchCartController() : super() {
    _listenToConnectivity();
  }

  static FetchCartController getInstance(BuildContext context) =>
      BlocProvider.of<FetchCartController>(context);

  fetchCart() async {
    emit(LoadingState());

    if (await NetworkManager.isConnected()) {
      final FetchCartUseCase useCase = FetchCartUseCase();
      final data = await useCase.call(params: UserIdQueryParams(userId: 1));

      if (data != null && data.data!.isNotEmpty) {
        cart.clear();
        getUserProduct(data.data!);
        await LocalStorageService.saveList<CartE>(
            data: data.data ?? [],
            toMap: (cart) => cart.toMap(),
            key: cartStorage);
        emit(SuccessState(cart));
      } else {
        emit(FailureState("Something went wrong"));
      }
    } else {
      List<CartE> cashedCart = await LocalStorageService.getList<CartE>(
          fromMap: (e) => CartModel.fromJson(e), key: cartStorage);
      getUserProduct(cashedCart);

      if (cart.isNotEmpty) {
        emit(SuccessState(cart));
      } else {
        emit(FailureState("No cached data available"));
      }
    }
  }

  getUserProduct(List<CartE> carts) {
    cart.clear();
    for (var item in carts) {
      if (item.userId == 1) {
        for (var p in item.products!) {
          cart.add(p);
        }
      }
    }
  }

  void _listenToConnectivity() {
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((connectivityResults) {
      if (connectivityResults.contains(ConnectivityResult.mobile) ||
          connectivityResults.contains(ConnectivityResult.wifi)) {
        fetchCart();
      }
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
