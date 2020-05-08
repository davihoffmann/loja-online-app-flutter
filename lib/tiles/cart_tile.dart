import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lojavirtual/datas/cart_product.dart';
import 'package:lojavirtual/datas/product_data.dart';

class CartTile extends StatelessWidget {
  final CartProduct product;

  CartTile(this.product);

  @override
  Widget build(BuildContext context) {
    Widget _buildContent() {
      return Container();
    }

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: product.productData == null
          ? FutureBuilder<DocumentSnapshot>(
              future: Firestore.instance
                  .collection("products")
                  .document(product.category)
                  .collection("items")
                  .document(product.id)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  product.productData = ProductData.fromDocument(snapshot.data);
                  return _buildContent();
                } else {
                  return Container(
                    height: 70.0,
                    child: CircularProgressIndicator(),
                    alignment: Alignment.center,
                  );
                }
              },
            )
          : _buildContent(),
    );
  }
}
