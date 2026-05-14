import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/components/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.5,
        crossAxisSpacing: 2,
        mainAxisSpacing: 20,
      ),
      children: 
      dummyCategories.map((cat) {
        return CategoryItem(cat);
      }).toList(),
    );
  }
}