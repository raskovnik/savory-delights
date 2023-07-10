import 'package:the_mealdb_api/the_mealdb_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categorymeals_state.dart';

class CategorymealsCubit extends Cubit<CategorymealsState> {
  final String category;
  final TheMealdbApiClient apiClient = TheMealdbApiClient();

  CategorymealsCubit({required this.category}) : super(CategorymealsLoading()) {
    loadCategoryMeals();
  }

  Future<void> loadCategoryMeals() async {
    try {
    final data = await apiClient.loadMealsByCategory(category);
    emit(CategorymealsLoaded(data: data));
    } catch (e) {
      emit(CategorymealsLoadFailed());
    }
  }
}
