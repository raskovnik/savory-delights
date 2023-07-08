import 'package:json_annotation/json_annotation.dart';
part 'recipe_data.g.dart';

@JsonSerializable()
class RecipeData {
  @JsonKey(name: 'strMeal')
  final String title;
  @JsonKey(name: 'idMeal')
  final String id;
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

  RecipeData({
    required this.title,
    required this.id,
    required this.category,
    required this.area,
    required this.instructions,
    required this.imageURL,
    required this.videoURL,
    // required this.ingredients,
    // required this.measures,
  });

  factory RecipeData.fromJson(Map<String, dynamic> json) => _$RecipeDataFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeDataToJson(this);
}
