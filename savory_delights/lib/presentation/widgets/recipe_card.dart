import 'package:flutter/material.dart';
import 'package:savory_delights/presentation/screens/recipe_page.dart';
import 'package:the_mealdb_api/the_mealdb_api.dart';

class RecipeCard extends StatefulWidget {
  final Recipe recipe;

  const RecipeCard({required this.recipe, Key? key}) : super(key: key);

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.85,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => RecipePage(recipe: widget.recipe)));        
        },
        child: Card(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21.0),
                  image: DecorationImage(
                    image: NetworkImage(widget.recipe.imageURL),
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
                    widget.recipe.title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.recipe.isFavorite = !widget.recipe.isFavorite;
                    });
                  },
                  child: Icon(
                    widget.recipe.isFavorite == false ? Icons.favorite_border : Icons.favorite,
                    color: Colors.red,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

