part of 'categorymeals_cubit.dart';

abstract class CategorymealsState {}

class CategorymealsLoading extends CategorymealsState {}

class CategorymealsLoadFailed extends CategorymealsState {}

class CategorymealsLoaded extends CategorymealsState {
  final List<Recipe> data;

  CategorymealsLoaded({required this.data});
}

