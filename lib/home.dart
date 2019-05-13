import 'package:flutter/material.dart';
import 'model/product.dart';
import 'model/products_repository.dart';
import 'supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  final Category category;
  const HomePage({this.category : Category.all});
  @override
  Widget build(BuildContext context) {
    return AsymmetricView(products: ProductRepository.loadProducts(category),);
  }

}