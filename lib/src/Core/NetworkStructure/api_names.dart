import 'package:flutter_base/src/Core/Constants/strings/app_strings.dart';

mixin ApiNames {
  static const String baseUrl = "https://fakestoreapi.com/";

  final String uRLFetchProduct = '${baseUrl}products';
  final String uRLFetchCart = '${baseUrl}carts';
  final String uRLFetchCategories = '${baseUrl}products/categories';

  /// Convert URL String to function that make me able to pass a category name
  String uRLFetchCategory({required String category}) =>
      '${baseUrl}products/category/$category';
}
