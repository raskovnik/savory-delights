import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:the_mealdb_api/src/models/models.dart';

class RecipeRequestFailure implements Exception {}

class RecipeNotFoundFailure implements Exception {}

class FetchRequestFailure implements Exception {}

class TheMealdbApiClient {
  TheMealdbApiClient({http.Client? httpClient}): _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  static const _baseUrl = 'www.themealdb.com';

  Future<Recipe> recipeSearch(String meal) async {
    final recipeRequest = Uri.https(
      _baseUrl,
      'api/json/v1/1/search.php?',
      {'s': meal}
    );

    final recipeResponse = await _httpClient.get(recipeRequest);

    if (recipeResponse.statusCode != 200) {
      throw RecipeRequestFailure();
    }

    final recipeJson = jsonDecode(recipeResponse.body) as Map;

    if (!recipeJson.containsKey("meals")) throw RecipeNotFoundFailure();

    final results = recipeJson['meals'] as List;

    if (results.isEmpty) throw RecipeNotFoundFailure();

    return Recipe.fromJson(results.first as Map<String, dynamic>);
  }

  Future<List<Category>> getCategories() async {
    final categoryRequest = Uri.https(
      _baseUrl,
      'api/json/v1/1/categories.php'
    );

    final categoryResponse = await _httpClient.get(categoryRequest);

    if (categoryResponse.statusCode != 200) {
      throw FetchRequestFailure();
    }

    final categoryJson = jsonDecode(categoryResponse.body) as Map;

    var categories = categoryJson['categories'];
    List<Category> results = [];

    for (var category in categories) {
      results.add(Category.fromJson(category));
    }

    return results;
  }

  Future<Recipe> getRandomMeal() async {
    final randomMealRequest = Uri.https(
      _baseUrl,
      'api/json/v1/1/random.php'
    );

    final randomMealResponse = await _httpClient.get(randomMealRequest);

    if (randomMealResponse.statusCode != 200) {
      throw RecipeRequestFailure();
    }

    final randomMealJson = jsonDecode(randomMealResponse.body) as Map;

    final results = randomMealJson["meals"] as List;
    if (results.isEmpty) throw FetchRequestFailure();

    return Recipe.fromJson(results.first as Map<String, dynamic>);


  }

  Future<List<Recipe>> loadMeals() async {
    final List<Category> categories = await getCategories();
    final List<Recipe> allRecipes = [];

    for (var category in categories) {
      allRecipes.addAll(await loadMealsByCategory(category.name));
    }
    return allRecipes;
  }

  Future<List<Recipe>> loadMealsByCategory(String category) async {
    final categoryMealsRequest = Uri.https(
      _baseUrl,
      '/api/json/v1/1/filter.php',
      {'c': category}
    );

    final categoryMealsResponse = await _httpClient.get(categoryMealsRequest);

    if (categoryMealsResponse.statusCode != 200) {
      throw RecipeRequestFailure();
    }

    final categoryMealsJson = jsonDecode(categoryMealsResponse.body);
    final results = categoryMealsJson["meals"] as List;
    if (results.isEmpty) throw FetchRequestFailure();

    List<Recipe> categoryMeals = [];
    for (var result in results) {
      categoryMeals.add(Recipe.fromJson(result));
    }
    return categoryMeals;
  }
}