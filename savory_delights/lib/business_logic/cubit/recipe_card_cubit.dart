import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_mealdb_api/the_mealdb_api.dart';

part 'recipe_card_state.dart';

class RecipeCardCubit extends Cubit<RecipeCardState> {
  final TheMealdbApiClient apiClient = TheMealdbApiClient();

  RecipeCardCubit() : super(RecipeCardLoading()) {
    fetchRandomMeal();
  }

  Future<void> fetchRandomMeal() async {
    try {
      final List<Recipe> recipe = [];
      for (var i = 0; i <= 2; i++) {
        recipe.add(await apiClient.getRandomMeal());
      }
      emit(RecipeCardLoaded(recipe));
    } catch (_) {
      emit(RecipeCardLoadFailed());
    }
  }
}
