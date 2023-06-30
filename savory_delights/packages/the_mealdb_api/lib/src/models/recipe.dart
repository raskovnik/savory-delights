import 'package:json_annotation/json_annotation.dart';
// import 'package:json_serializable/json_serializable.dart';
part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  @JsonKey(name: 'strMeal')
  final String title;
  @JsonKey(name: 'strCategory')
  final String category;
  @JsonKey(name: 'strArea')
  final String area;
  @JsonKey(name: 'strInstructions')
  final String instructions;
  @JsonKey(name: 'strMealThumb')
  final String imageURL;
  @JsonKey(name: 'strYoutube')
  final String videoURL;
  // final List<String> ingredients;
  // final List<String> measures;

  Recipe({
    required this.title,
    required this.category,
    required this.area,
    required this.instructions,
    required this.imageURL,
    required this.videoURL,
    // required this.ingredients,
    // required this.measures,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
