import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String? id;
  String? productName;
  String? productCategory;
  int? productPrice;
  String? productDiscount;
  String? productDescription;
  List<dynamic>? images;

  ProductModel(
      {this.id,
      this.productName,
      this.productCategory,
      this.productPrice,
      this.productDiscount,
      this.productDescription,
      this.images});

  ProductModel copyWith(
          {String? id,
          String? productName,
          String? productCategory,
          int? productPrice,
          String? productDiscount,
          String? productDescription,
          List<String>? images}) =>
      ProductModel(
          id: id ?? this.id,
          productName: productName ?? this.productName,
          productCategory: productCategory ?? this.productCategory,
          productPrice: productPrice ?? this.productPrice,
          productDiscount: productDiscount ?? this.productDiscount,
          productDescription: productDescription ?? this.productDescription,
          images: images ?? this.images);

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json["id"],
      productName: json["product_name"],
      productCategory: json["product_category"],
      productPrice: json["product_price"],
      productDiscount: json["product_discount"],
      productDescription: json["product_description"],
      images: json['images']);

  Map<String, dynamic> toJson() => {
        "product_name": productName,
        "product_category": productCategory,
        "product_price": productPrice,
        "product_discount": productDiscount,
        "product_description": productDescription,
        "images": images
      };
}
