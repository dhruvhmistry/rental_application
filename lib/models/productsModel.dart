// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

ProductsModel productsModelFromJson(String str) =>
    ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
  int id;
  String name;
  int category;
  int subcategory;
  String item;
  int price;
  int quantity;
  int status;
  String currentStatus;
  int totalQty;
  String description;
  int vendorId;
  dynamic createdAt;
  dynamic updatedAt;
  List<ProductImage> productImage;
  List<Clothdatum> clothdata;

  ProductsModel({
    required this.id,
    required this.name,
    required this.category,
    required this.subcategory,
    required this.item,
    required this.price,
    required this.quantity,
    required this.status,
    required this.currentStatus,
    required this.totalQty,
    required this.description,
    required this.vendorId,
    required this.createdAt,
    required this.updatedAt,
    required this.productImage,
    required this.clothdata,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        subcategory: json["subcategory"],
        item: json["Item"],
        price: json["price"],
        quantity: json["quantity"],
        status: json["status"],
        currentStatus: json["current_status"],
        totalQty: json["total_qty"],
        description: json["description"],
        vendorId: json["vendor_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        productImage: List<ProductImage>.from(
            json["product_image"].map((x) => ProductImage.fromJson(x))),
        clothdata: List<Clothdatum>.from(
            json["clothdata"].map((x) => Clothdatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "subcategory": subcategory,
        "Item": item,
        "price": price,
        "quantity": quantity,
        "status": status,
        "current_status": currentStatus,
        "total_qty": totalQty,
        "description": description,
        "vendor_id": vendorId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "product_image":
            List<dynamic>.from(productImage.map((x) => x.toJson())),
        "clothdata": List<dynamic>.from(clothdata.map((x) => x.toJson())),
      };
}

class Clothdatum {
  int id;
  int size;
  String colour;
  int productId;
  dynamic createdAt;
  dynamic updatedAt;

  Clothdatum({
    required this.id,
    required this.size,
    required this.colour,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Clothdatum.fromJson(Map<String, dynamic> json) => Clothdatum(
        id: json["id"],
        size: json["size"],
        colour: json["colour"],
        productId: json["product_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "size": size,
        "colour": colour,
        "product_id": productId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class ProductImage {
  int id;
  String file;
  int productId;
  dynamic createdAt;
  dynamic updatedAt;

  ProductImage({
    required this.id,
    required this.file,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        file: json["file"],
        productId: json["product_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "file": file,
        "product_id": productId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
