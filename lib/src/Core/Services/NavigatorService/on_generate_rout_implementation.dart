import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/src/Features/Cart/presentation/pages/cart_page.dart';
import 'package:flutter_base/src/Features/Categories/presentation/pages/category_products_page.dart';
import 'package:flutter_base/src/Features/Home/domain/entities/productE.dart';
import 'package:flutter_base/src/Features/ProductDetails/presentation/pages/product_details_page.dart';

import '../../Constants/Navigation/navigation_cons.dart';

class OnGenerateRoutImplementation {
  OnGenerateRoutImplementation._();

  static final OnGenerateRoutImplementation _instance =
      OnGenerateRoutImplementation._();

  factory OnGenerateRoutImplementation() {
    return _instance;
  }

  Route<dynamic>? onGenerateRout(RouteSettings setting) {
    switch (setting.name) {
      case productDetailsPage:
        ProductE product = setting.arguments as ProductE;
        return CupertinoPageRoute(
            builder: (_) => ProductDetailsPage(product: product));
      case cartPage:
        return CupertinoPageRoute(builder: (_) => const CartPage());
      case categoryProductsPage:
        String category = setting.arguments as String;
        return CupertinoPageRoute(
            builder: (_) => CategoryProductsPage(category: category));

      default:
        return null;
    }
  }
}
