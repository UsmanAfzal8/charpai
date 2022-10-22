import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';
import 'empty_cart_screen.dart';
import 'fill_cart_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    CartProvider cartPro = Provider.of<CartProvider>(context);
    return Scaffold(
      body: cartPro.cartItem.isNotEmpty ? FillCartScreen() : EmptyCartScreen(),
    );
  }
}
