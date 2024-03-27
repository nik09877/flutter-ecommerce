class ProductModel {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;
  const ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});
  ProductModel copyWith(
      {int? id,
      String? title,
      double? price,
      String? description,
      String? category,
      String? image,
      Rating? rating}) {
    return ProductModel(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        category: category ?? this.category,
        image: image ?? this.image,
        rating: rating ?? this.rating);
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating?.toJson()
    };
  }

  static ProductModel fromJson(Map<String, Object?> json) {
    return ProductModel(
        id: json['id'] == null ? null : json['id'] as int,
        title: json['title'] == null ? null : json['title'] as String,
        price: json['price'] == null ? null : json['price'] as double,
        description:
            json['description'] == null ? null : json['description'] as String,
        category: json['category'] == null ? null : json['category'] as String,
        image: json['image'] == null ? null : json['image'] as String,
        rating: json['rating'] == null
            ? null
            : Rating.fromJson(json['rating'] as Map<String, Object?>));
  }

  @override
  String toString() {
    return '''ProductModel(
                id:$id,
title:"$title",
price:$price,
description:"$description",
category:"$category",
image:"$image",
rating:${rating.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is ProductModel &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.title == title &&
        other.price == price &&
        other.description == description &&
        other.category == category &&
        other.image == image &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, id, title, price, description, category, image, rating);
  }
}

class Rating {
  final double? rate;
  final int? count;
  const Rating({this.rate, this.count});
  Rating copyWith({double? rate, int? count}) {
    return Rating(rate: rate ?? this.rate, count: count ?? this.count);
  }

  Map<String, Object?> toJson() {
    return {'rate': rate, 'count': count};
  }

  static Rating fromJson(Map<String, Object?> json) {
    return Rating(
        rate: json['rate'] == null ? null : json['rate'] as double,
        count: json['count'] == null ? null : json['count'] as int);
  }

  @override
  String toString() {
    return '''Rating(
                rate:$rate,
count:$count
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Rating &&
        other.runtimeType == runtimeType &&
        other.rate == rate &&
        other.count == count;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, rate, count);
  }
}
