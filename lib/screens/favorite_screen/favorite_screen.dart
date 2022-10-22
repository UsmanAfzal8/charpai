import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/product_provider.dart';
import 'empty_fvrt_screen.dart';
import 'fill_fvrt_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ProductProvider productPro = Provider.of(context);
    return Scaffold(
      body: productPro.favorites.isEmpty
          ? const EmptyFvrtScreen()
          : const FillFvrtScreen(),
    );
  }
}
