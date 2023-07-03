part of 'recipe_cubit.dart';

abstract class RecipeState {}

class RecipeLoading extends RecipeState{}

class RecipeCardLoading extends RecipeState{}

class RecipeLoaded extends RecipeState{
  final List<Category> categories;

  RecipeLoaded(this.categories);
}

class RecipeCardLoaded extends RecipeState {
  final Recipe recipe;
  RecipeCardLoaded(this.recipe);
}

class RecipeLoadFailed extends RecipeState {}