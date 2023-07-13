import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_mealdb_api/the_mealdb_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final TheMealdbApiClient apiClient = TheMealdbApiClient();  

  FavoritesCubit() : super(FavoritesLoading()) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favs = prefs.getStringList("favorites") ?? [];

    List<Recipe> favorites = [];
    try {
      for (String id in favs) {
        favorites.add(await apiClient.loadRecipeById(id));
      }
      for (Recipe fav in favorites) {
        fav.isFavorite = true;
      }
      emit(FavoritesLoaded(favs: favorites));
    } catch (e) {
      emit(FavoritesLoadFailed());
    }
  }
}
