import 'package:flutter_base/src/Features/Home/data/models/rating_model.dart';
import 'package:flutter_base/src/Features/Home/domain/entities/productE.dart';

class ProductModel extends ProductE {
  ProductModel(
      {super.category,
      super.description,
      super.id,
      super.price,
      super.title,
      super.image,
      super.quantity,
      super.rating});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        category: json['category'] ?? "",
        description: json['description'] ?? "",
        id: json['id'] ?? 0,
        price:
            json['price'] != null ? double.parse(json['price'].toString()) : 0,
        title: json['title'] ?? "",
        image: json['image'] ?? "",
        quantity: json['quantity'] ?? 0,
        rating: json['rating'] != null
            ? RatingModel.fromJson(json['rating'])
            : null);
  }

  static List<ProductE> fakeCart = [
    ProductE(
        category: 'Electronics',
        description: 'Smartphone Xiaomi',
        id: 1,
        price: 500.0,
        title: 'Xiaomi Mi 10',
        image:
            'https://img.drz.lazcdn.com/static/bd/p/60298bcd1702bd9f876c7b22d7ca0431.jpg_960x960q80.jpg_.webp',
        quantity: 3),
    ProductE(
        category: 'Clothing',
        description: 'Nike Air Zoom Pegasus 37',
        id: 2,
        price: 150.0,
        title: 'Nike Air Zoom Pegasus 37',
        image:
            'https://assets.manufactum.de/p/210/210605/210605_01.jpg/mens-quilted-jacket-hood.jpg',
        quantity: 1),
    ProductE(
        category: 'Home',
        description: 'Smart Thermostat',
        id: 3,
        price: 100.0,
        image:
            "https://www.montecarlo.in/cdn/shop/products/223061786-2-38_5.jpg?v=1700556450",
        quantity: 2)
  ];
}
