import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/categories_provider.dart';
import '../home_screen/categories/categories_extend.dart';

class SerachScreen extends StatelessWidget {
  const SerachScreen({super.key});
  @override
  Widget build(BuildContext context) {
    CategoriesProvider categoriesPro = Provider.of<CategoriesProvider>(context);
    List<String> categories = categoriesPro.forSearch();
    return Scaffold(
      appBar: AppBar(
        title: const Text('SerachScreen'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color:
                        const Color.fromARGB(255, 66, 66, 66).withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: TextField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search...'),
                // onChanged: (String val) => testPro.onSearch(val),
                onChanged: (String val) => categoriesPro.onSearch(val),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              print(categories.length);
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      // ignore: always_specify_types
                      MaterialPageRoute(
                          builder: (BuildContext context) => CategoriesExtend(
                                categoryName: categories[index],
                              )));
                },
                title: Text(
                  categories[index],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
