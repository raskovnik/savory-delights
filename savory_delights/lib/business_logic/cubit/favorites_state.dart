part of 'favorites_cubit.dart';

abstract class FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  List<Recipe> favs;
  FavoritesLoaded({required this.favs});

}

class FavoritesLoadFailed extends FavoritesState {}