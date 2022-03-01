import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/bloc/cart_bloc.dart';
import 'package:test_app/models/cart_item.dart';
import 'package:test_app/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, 
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final price = NumberFormat("#,##0.00", "pt_BR");
    final bloc = Provider.of<CartBloc>(context);

    var item = CartItem(
      id: product.id,
      price: product.price,
      image: product.image,
      quantity: 1,
      title: product.title,
    );

    return Container(
      width: double.infinity,
      height: 150,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          Image.network(product.image),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "R\$ ${product.price}",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  bloc.itemInCart(item)
                      ? TextButton(
                          onPressed: () {
                            bloc.remove(item);
                          },
                          child: const Text("Remover"),
                        )
                      : TextButton(
                          onPressed: () {
                            bloc.add(item);
                          },
                          child: const Text("Adicionar"),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
