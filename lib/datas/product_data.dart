import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {
  String id;
  String title;
  String description;
  double price;
  List images;
  List sizes;
  String category;

  ProductData.fromDocument(DocumentSnapshot snapshot) {
    this.id = snapshot.documentID;
    this.title = snapshot.data['title'];
    this.description = snapshot.data['description'];
    this.price = snapshot.data['price'] + 0.0;
    this.sizes = snapshot.data['sizes'];
    this.images = snapshot.data['images'];
  }

  Map<String, dynamic> toResumedMap() {
    return {"title": title, "description": description, "price": price};
  }
}
