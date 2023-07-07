import 'package:json_annotation/json_annotation.dart';
// import 'package:json_serializable/json_serializable.dart';
part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  @JsonKey(name: 'strMeal')
  final String title;
  @JsonKey(name: 'idMeal')
  final String id;
  // @JsonKey(name: 'strCategory')
  // final String category;
  // @JsonKey(name: 'strArea')
  // final String area;
  // @JsonKey(name: 'strInstructions')
  // final String instructions;
  @JsonKey(name: 'strMealThumb')
  final String imageURL;
  // @JsonKey(name: 'strYoutube')
  // final String videoURL;
  // final List<String> ingredients;
  // final List<String> measures;

  Recipe({
    required this.title,
    required this.id,
    // required this.category ?? "Meh",
    // required this.area ?? "Meh",
    // required this.instructions ?? "Meh",
    required this.imageURL,
    // required this.videoURL ?? "Meh",
    // required this.ingredients,
    // required this.measures,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
