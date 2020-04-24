import 'package:flutter/material.dart';
import 'package:lojavirtual/datas/product_data.dart';

class ProductDetailScreen extends StatefulWidget {

  final ProductData product;

  ProductDetailScreen(this.product);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState(product);
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  final ProductData product;

  _ProductDetailScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
    );
  }
}
