import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/categories_provider.dart';
import 'categories_extend.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesProvider catPro = Provider.of<CategoriesProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
        ),
        body: GridView.count(
          childAspectRatio: 100 / 80,
          mainAxisSpacing: 8,
          crossAxisCount: 2,
          // ignore: always_specify_types
          children: List.generate(catPro.categories.length, (int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    // ignore: always_specify_types
                    MaterialPageRoute(
                        builder: (BuildContext context) => CategoriesExtend(
                              categoryName: catPro.categories[index].title,
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        catPro.categories[index].title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            );
          }),
        ));
  }
}
