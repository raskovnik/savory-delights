part of 'recipe_cubit.dart';

abstract class RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final RecipeData data;

  RecipeLoaded(this.data);
}

class RecipeLoadFailed extends RecipeState {
  final String e;

  RecipeLoadFailed(this.e);
}