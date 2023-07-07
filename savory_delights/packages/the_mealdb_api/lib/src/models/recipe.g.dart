// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      title: json['strMeal'] as String,
      id: json['idMeal'] as String,
      imageURL: json['strMealThumb'] as String,
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'strMeal': instance.title,
      'idMeal': instance.id,
      'strMealThumb': instance.imageURL,
    };
