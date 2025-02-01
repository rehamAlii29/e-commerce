import 'package:flutter_base/src/Features/Home/domain/entities/ratingE.dart';

class RatingModel extends RatingE {
  RatingModel({super.rate, super.count});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: double.parse(json["rate"].toString()) ?? 0,
      count: json["count"] ?? 0,
    );
  }
}
