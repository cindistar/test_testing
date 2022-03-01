
// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:test_app/models/cart_item.dart';

class CartBloc extends ChangeNotifier {
  // ignore: deprecated_member_use
  final cart = []; 
  double total = 0;

  get() {
    return cart;
  }

  add(CartItem item) {
    cart.add(item);
    calculateTotal();
  }

  remove(CartItem item) {
    cart.removeWhere((x) => x.id == item.id);
    calculateTotal();
  }

  itemInCart(CartItem item) {
    var result = false;
    cart.forEach((x) {
      if (item.id == x.id) result = true;
    });
    return result;
  }

  calculateTotal() {
    total = 0;
    cart.forEach((x) {
      total += (x.price * x.quantity);
    });
    notifyListeners();
  }
}
