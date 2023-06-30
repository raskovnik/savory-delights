// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      title: json['strMeal'] as String,
      category: json['strCategory'] as String,
      area: json['strArea'] as String,
      instructions: json['strInstructions'] as String,
      imageURL: json['strMealThumb'] as String,
      videoURL: json['strYoutube'] as String,
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'strMeal': instance.title,
      'strCategory': instance.category,
      'strArea': instance.area,
      'strInstructions': instance.instructions,
      'strMealThumb': instance.imageURL,
      'strYoutube': instance.videoURL,
    };
