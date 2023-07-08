import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_mealdb_api/the_mealdb_api.dart';

part 'recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  final String id;
  final TheMealdbApiClient apiClient = TheMealdbApiClient();

  RecipeCubit({required this.id}) : super(RecipeLoading()) {
    fetchMealById(id);
  }

  Future<void> fetchMealById(String id) async {
    try {
      final RecipeData data = await apiClient.loadMealById(id);
      emit(RecipeLoaded(data));
    } catch (e) {
      emit(RecipeLoadFailed(e.toString()));
    }
  } 
}
