import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/product_provider.dart';
import '../home_screen/list_view/list_view_extend.dart';

class FillFvrtScreen extends StatefulWidget {
  const FillFvrtScreen({super.key});

  @override
  State<FillFvrtScreen> createState() => _FillFvrtScreenState();
}

class _FillFvrtScreenState extends State<FillFvrtScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> favList = Provider.of<ProductProvider>(context).favorites;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Screen'),
      ),
      body: GridView.count(
        childAspectRatio: 200 / 280,
        mainAxisSpacing: 8,
        crossAxisCount: 2,
        children: List.generate(favList.length, (int index) {
          return ListViewScreen(
            product:
                Provider.of<ProductProvider>(context, listen: false).product(
              favList[index],
            ),
          );
        }),
      ),
    );
  }
}
