part of 'recipe_card_cubit.dart';

abstract class RecipeCardState {}

class RecipeCardLoading extends RecipeCardState {}

class RecipeCardLoaded extends RecipeCardState {
  final Recipe recipe;

  RecipeCardLoaded(this.recipe);
}

class RecipeCardLoadFailed extends RecipeCardState {}
