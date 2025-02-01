import 'package:flutter_base/src/Features/Home/domain/entities/categoryE.dart';

class CategoryModel extends CategoryE {
  CategoryModel({required super.id, required super.name});

  static List<CategoryE> fakeCategory = [
    CategoryE(id: 1, name: 'All'),
    CategoryE(id: 2, name: 'jacet'),
    CategoryE(id: 3, name: 'jeanse'),
    CategoryE(id: 4, name: 'shoce'),
    CategoryE(id: 5, name: 'Category 5'),
    CategoryE(id: 6, name: 'Category 6'),
    CategoryE(id: 7, name: 'Category 7'),
    CategoryE(id: 8, name: 'Category 8'),
    CategoryE(id: 9, name: 'Category 9'),
    CategoryE(id: 10, name: 'Category 10'),
    CategoryE(id: 11, name: 'Category 11'),
    CategoryE(id: 12, name: 'Category 12'),
  ];
}
