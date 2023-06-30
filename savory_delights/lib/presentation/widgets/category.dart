import 'package:flutter/material.dart';
import 'package:the_mealdb_api/the_mealdb_api.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;
  const CategoryWidget({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Card(
      child: Container(
        height: screenSize.height * 0.1,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(category.imageURL),
            fit: BoxFit.cover,
          )
        ),
        child: ListTile(
          title: Text(category.name,
          style:const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
          )
        )
      )
    );
  }
}