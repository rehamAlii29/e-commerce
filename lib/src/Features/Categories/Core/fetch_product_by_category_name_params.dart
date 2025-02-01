import 'package:flutter_base/src/Core/NetworkStructure/Params/params.dart';

class FetchProductByCategoryNameParams extends Params {
  final String categoryName;

  FetchProductByCategoryNameParams({required this.categoryName});

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
