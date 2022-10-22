import 'package:flutter/cupertino.dart';

import '../models/cart.dart';
import '../models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Cart> _cartItems = <Cart>[];
  List<Cart> get cartItem => _cartItems;

  void addtocart(Product value, int quantity) {
    Cart temp = Cart(
        id: value.pid,
        title: value.productname,
        imageurl: value.imageurl,
        price: value.amount,
        quantity: quantity);

    _cartItems.add(temp);
    notifyListeners();
  }

  bool checkExit(Product value) {
    bool temp = false;
    final int index = _indexOfSelectedIndex(value.pid);
    if (index >= 0) {
      temp = true;
    } else {}

    return temp;
  }

  void removeProduct(String value) {
    final int index = _indexOfSelectedIndex(value);
    if (index >= 0) {
      _cartItems[index].quantity = _cartItems[index].quantity - 1;
    } else {}

    notifyListeners();
  }

  void addProduct(String value) {
    print('Enter Ho giya');
    final int index = _indexOfSelectedIndex(value);
    if (index >= 0) {
      _cartItems[index].quantity = _cartItems[index].quantity + 1;
    } else {}

    notifyListeners();
  }

  int _indexOfSelectedIndex(String testID) {
    return _cartItems.indexWhere((Cart element) => element.id == testID);
  }

  void deleteItem(String id) {
    // ignore: list_remove_unrelated_type
    _cartItems.remove(id);
    notifyListeners();
  }

  double totalPrice() {
    double temp = 0;
    for (Cart element in _cartItems) {
      temp += element.quantity * element.price;
    }
    return temp;
  }
}
