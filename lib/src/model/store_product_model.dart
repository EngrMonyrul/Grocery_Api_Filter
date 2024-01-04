import 'package:simplegrocery/src/model/rating_model.dart';

class StoreProduct {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  StoreProduct(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  StoreProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    dynamic priceValue = json['price'];
    if (priceValue is int) {
      price = priceValue.toDouble();
    } else if (priceValue is double) {
      price = priceValue;
    } else {
      price = 0.0;
    }
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['category'] = this.category;
    data['image'] = this.image;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    return data;
  }
}
