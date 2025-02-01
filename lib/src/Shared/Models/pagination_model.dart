import 'package:flutter_base/src/Shared/Entities/pagination.dart';
import 'package:flutter_base/src/Core/Utils/general_utils.dart';

class PaginationModel extends Pagination {
  PaginationModel(
      {String? next,
      String? prev,
      int? total,
      int? current,
      int? count,
      int? last})
      : super(
            next: next,
            total: total,
            count: count,
            current: current,
            last: last,
            prev: prev);

  factory PaginationModel.fromJson(Map<String, dynamic> map) {
    return PaginationModel(
      prev: map['prev'] ?? '',
      count: map['count'] ?? 0,
      current: map['current'] ?? 0,
      last: map['last'] ?? 0,
      next: map['next'] ?? '',
      total: map['total'] ?? 0,
    );
  }
}
