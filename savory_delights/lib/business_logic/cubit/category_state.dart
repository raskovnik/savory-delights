part of 'category_cubit.dart';

abstract class CategoryState {}

class CategoryLoading extends CategoryState{}

class CategoryLoaded extends CategoryState{
  final List<Category> categories;

  CategoryLoaded(this.categories);
}

class CategoryLoadFailed extends CategoryState {}