import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_mealdb_api/the_mealdb_api.dart';

part 'recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  final TheMealdbApiClient apiClient = TheMealdbApiClient();

  RecipeCubit() : super(RecipeLoading()) {
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      final List<Category> categories = await apiClient.getCategories();
      emit(RecipeLoaded(categories));
    } catch (_) {
      emit(RecipeLoadFailed());
    }
  }

}
