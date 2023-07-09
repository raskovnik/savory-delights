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
  late List<String> measures;
  late List<String> ingredients;

  RecipeData({
    required this.title,
    required this.id,
    required this.category,
    required this.area,
    required this.instructions,
    required this.imageURL,
    required this.videoURL,
    List<String>? measures,
    List<String>? ingredients
  }) : measures = measures ?? [], ingredients = ingredients ?? [];

  factory RecipeData.fromJson(Map<String, dynamic> json) {
    RecipeData recipe = _$RecipeDataFromJson(json);
    recipe.ingredients = List<String>.generate(20, (index) {
      final ingredient = json['strIngredient${index + 1}'];
      return ingredient != null && ingredient.isNotEmpty ? ingredient : '';
    });
    recipe.measures = List<String>.generate(20, (index) {
      final measure = json['strMeasure${index + 1}'];
      return measure != null && measure.isNotEmpty ? measure : '';
    });

    return recipe;
  }

  Map<String, dynamic> toJson() => _$RecipeDataToJson(this);
}
