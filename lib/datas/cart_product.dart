import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lojavirtual/datas/product_data.dart';

class CartProduct {
  String id;
  String category;
  String productId;
  int quantity;
  String size;
  ProductData productData;

  CartProduct();

  CartProduct.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    category = document.data["category"];
    productId = document.data["productId"];
    quantity = document.data["quantity"];
    size = document.data["size"];
  }

  Map<String, dynamic> toMap() {
    return {
      "category": category,
      "productId": productId,
      "quantity": quantity,
      "size": size,
      "product": productData.toResumedMap()
    };
  }

  @override
  String toString() {
    return "CartProduct(id: $id, category: $category, productId: $productId)";
  }
}
