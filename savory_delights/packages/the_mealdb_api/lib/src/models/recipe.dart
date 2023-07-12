import 'package:json_annotation/json_annotation.dart';
part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  @JsonKey(name: 'strMeal')
  final String title;
  @JsonKey(name: 'idMeal')
  final String id;
  @JsonKey(name: 'strMealThumb')
  final String imageURL;

  final bool isFavorite = false;

  Recipe({
    required this.title,
    required this.id,
    required this.imageURL,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
