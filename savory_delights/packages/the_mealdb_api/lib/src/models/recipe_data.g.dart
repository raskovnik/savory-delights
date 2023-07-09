// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeData _$RecipeDataFromJson(Map<String, dynamic> json) => RecipeData(
      title: json['strMeal'] as String,
      id: json['idMeal'] as String,
      category: json['strCategory'] as String,
      area: json['strArea'] as String,
      instructions: json['strInstructions'] as String,
      imageURL: json['strMealThumb'] as String,
      videoURL: json['strYoutube'] as String,
      measures: (json['measures'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RecipeDataToJson(RecipeData instance) =>
    <String, dynamic>{
      'strMeal': instance.title,
      'idMeal': instance.id,
      'strCategory': instance.category,
      'strArea': instance.area,
      'strInstructions': instance.instructions,
      'strMealThumb': instance.imageURL,
      'strYoutube': instance.videoURL,
      'measures': instance.measures,
      'ingredients': instance.ingredients,
    };
