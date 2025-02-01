import 'dart:convert';

import 'package:flutter_base/src/Features/Home/data/models/product_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import '../../../Features/Home/domain/entities/productE.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();

  factory LocalStorageService() {
    return _instance;
  }

  LocalStorageService._internal();

  static Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
  }

  static Future<void> saveList<E>(
      {required List<E> data,
      required Map<String, dynamic> Function(E) toMap,
      required String key}) async {
    final box = await Hive.openBox<String>('productsBox');
    String jsonString = jsonEncode(data.map((e) => toMap(e)).toList());

    await box.put(key, jsonString);
    print("data saved successfully ");
  }

  static Future<List<E>> getList<E>(
      {required E Function(Map<String, dynamic>) fromMap,
      required String key}) async {
    final box = await Hive.openBox<String>("productsBox");
    String? jsonString = box.get(key);

    if (jsonString == null) return [];

    List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => fromMap(json)).toList();
  }

  Future<void> clearBox(String boxName) async {
    var box = await Hive.openBox(boxName);
    await box.clear();
  }

  static Future<void> clearProducts() async {
    final box = await Hive.openBox<String>('productsBox');
    await box.delete('products');
  }
}
