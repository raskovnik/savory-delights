part of 'home_cubit.dart';

abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Recipe> meals;
  HomeLoaded(this.meals);
}

class HomeLoadFailed extends HomeState{
  final String e;

  HomeLoadFailed(this.e);
}