import 'package:equatable/equatable.dart';

class RatingE extends Equatable {
  final double? rate;
  final int? count;

  RatingE({this.rate, this.count});

  @override
  List<Object> get props => [rate!, count!];

  Map<String, dynamic> toMap() {
    return {"rate": rate, "count": count};
  }
}
