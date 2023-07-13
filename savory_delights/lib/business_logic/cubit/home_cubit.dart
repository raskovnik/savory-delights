import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_mealdb_api/the_mealdb_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final TheMealdbApiClient apiClient = TheMealdbApiClient();

  HomeCubit() : super(HomeLoading()) {
    fetchMeals();
  }

  Future<void> fetchMeals() async {
    try {    
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> favs = prefs.getStringList("favorites") ?? [];
      final List<Recipe> meals = await apiClient.loadMeals();
      if (favs.isNotEmpty) {
        for (Recipe meal in meals) {
          meal.isFavorite = favs.contains(meal.id);
        }
      }
      emit(HomeLoaded(meals));
    } catch (e) {
      emit(HomeLoadFailed(e.toString()));
    }


  }
}
