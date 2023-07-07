import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_mealdb_api/the_mealdb_api.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final TheMealdbApiClient apiClient = TheMealdbApiClient();

  HomeCubit() : super(HomeLoading()) {
    fetchMeals();
  }

  Future<void> fetchMeals() async {
    try {    
      final List<Recipe> meals = await apiClient.loadMeals();
      print(meals.length);
      emit(HomeLoaded(meals));
    } catch (e) {
      print(e.toString());
      emit(HomeLoadFailed(e.toString()));
    }


  }
}
