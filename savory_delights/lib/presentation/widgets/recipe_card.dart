import 'package:flutter/material.dart';
import 'package:the_mealdb_api/the_mealdb_api.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const RecipeCard({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * .85,
      child: GestureDetector(
        onTap: () {
          print("Card has been clicked");
        },
        child: Card(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21.0),
                image: DecorationImage(
                  image: NetworkImage(recipe.imageURL),
                  fit: BoxFit.cover
                )
              )
            ),
        ),
      ),
    );
  }
}
