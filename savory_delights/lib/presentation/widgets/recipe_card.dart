import 'package:flutter/material.dart';
import 'package:savory_delights/presentation/screens/recipe_page.dart';
import 'package:the_mealdb_api/the_mealdb_api.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({required this.recipe, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.85,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RecipePage(recipe: recipe)));        
        },
        child: Card(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21.0),
                  image: DecorationImage(
                    image: NetworkImage(recipe.imageURL),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                left: 10,
                child: Container(
                  color: Colors.black.withOpacity(0.25),
                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    recipe.title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 10,
                right: 10,
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

