part of 'recipe_cubit.dart';

abstract class RecipeState {}

class RecipeLoading extends RecipeState{}

class RecipeLoaded extends RecipeState{
  final List<Category> categories;

  RecipeLoaded(this.categories);
}

class RecipeLoadFailed extends RecipeState {}