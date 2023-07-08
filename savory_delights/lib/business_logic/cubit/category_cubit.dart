import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_mealdb_api/the_mealdb_api.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final TheMealdbApiClient apiClient = TheMealdbApiClient();

  CategoryCubit() : super(CategoryLoading()) {
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      final List<Category> categories = await apiClient.getCategories();
      emit(CategoryLoaded(categories));
    } catch (_) {
      emit(CategoryLoadFailed());
    }
  }

}
