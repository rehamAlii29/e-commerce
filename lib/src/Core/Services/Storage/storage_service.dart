// import 'package:flutter_base/src/Core/Services/Storage/src/Resources/Get/imports_get_storage.dart';
import 'package:flutter_base/src/Core/Services/storage/src/Resources/Get/imports_get_storage.dart';
import 'package:flutter_base/src/Core/Services/storage/src/Resources/Hive/imports_hive_storage.dart';

// typedef StorageService<T> = HiveStorageImp<T>;
typedef StorageService<T> = GetStorageImp<T>;
// typedef StorageService<T> = PrefStorageImp<T>;
