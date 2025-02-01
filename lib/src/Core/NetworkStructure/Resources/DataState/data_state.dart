import 'package:flutter_base/src/Core/NetworkStructure/Resources/Errors/error_model.dart';
import 'package:flutter_base/src/Shared/Entities/pagination.dart';

abstract class DataState<T> {
  final T? data;
  final T? searchData;
  final Pagination? pagination;
  final ErrorModel? error;
  final String? message;

  const DataState({
    this.data,
    this.pagination,
    this.error,
    this.message,
    this.searchData,
  });

  @override
  String toString() {
    return 'DataState{data: $data, searchData: $searchData, pagination: $pagination, error: $error, message: $message}';
  }
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(
    T data, {
    String? message,
    T? searchData,
    Pagination? pagination,
  }) : super(
          data: data,
          message: message,
          pagination: pagination,
          searchData: searchData,
        );
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(ErrorModel error) : super(error: error);
}

class DataInitial<T> extends DataState<T> {
  DataInitial({T? data}) : super(data: data);
}

class DataLoading<T> extends DataState<T> {
  const DataLoading() : super();
}

class DataSearchLoading<T> extends DataState<T> {
  const DataSearchLoading() : super();
}
