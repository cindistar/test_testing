import 'package:flutter/material.dart';
import 'package:test_app/models/product_model.dart';
import 'package:test_app/repositories/repository.dart';
import 'package:test_app/widgets/connection_manager.dart';
import 'package:test_app/widgets/product_card.dart';

class ProductsPage extends StatelessWidget {
  final repository = ProductRepository();

  ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Produtos"),
      ),
      body: ConnectionManager(
        future: repository.getAll(),
        widget: (ctx, snpst) {
          List<Product> products = snpst.data;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (ctx, index) {
              return ProductCard(
                product: products[index],
              );
            },
          );
        },
      ),
    );
  }
}
