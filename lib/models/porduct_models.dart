import 'dart:convert';

List<ProductModel> userModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String userModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image, required rating,
  });

  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        title: json["title"],
        price: json["price"].toDouble(),
        description: json["description"],
        category: json["category"],
        image: json["image"],
        rating: Rating.fromJson(json["rating"]),

      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "rating": rating?.toJson(),
      };
}

class Rating {
    Rating({
    required this.rate,
    required this.count,

  });
  double? rate;
  int? count;

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
      count: json["count"], 
      rate: json["rate"].toDouble(),

      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
 
      };
}
