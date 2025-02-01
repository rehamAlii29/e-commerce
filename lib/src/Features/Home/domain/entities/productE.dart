import 'package:equatable/equatable.dart';
import 'package:flutter_base/src/Features/Home/domain/entities/ratingE.dart';

class ProductE extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final RatingE? rating;
  int quantity;

  ProductE(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating,
      this.quantity = 1});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        price,
        description,
        category,
        image,
        rating,
      ];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating?.toMap() ?? null
    };
  }
}
