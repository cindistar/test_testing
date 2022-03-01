import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/bloc/cart_bloc.dart';
import 'package:test_app/pages/cart_page.dart';
import 'package:test_app/pages/products_page.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CartBloc>(context);

    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          ProductsPage(),
          const CartPage(),
        ],
      ),
      bottomNavigationBar: TabBar(
        tabs: [
          const Tab(
            icon: Icon(Icons.home),
            text: "Produtos",
          ),
          Tab(
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.shopping_cart),
                Text(
                  bloc.cart.length.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            text: "Gato",
          ),
        ],
        labelColor: Colors.green,
        indicatorColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
