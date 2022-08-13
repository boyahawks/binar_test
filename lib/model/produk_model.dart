import 'dart:convert';

class ProdukModel {
  String? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Object? rating;

  ProdukModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating,
    };
  }

  factory ProdukModel.fromMap(Map<String, dynamic> map) {
    return ProdukModel(
      id: map['id'],
      title: map['title'],
      price: map['price'],
      description: map['description'],
      category: map['category'],
      image: map['image'],
      rating: map['rating'],
    );
  }

  String toJson() => json.encode(toMap());
}
