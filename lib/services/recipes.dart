import 'package:dio/dio.dart';
import 'package:foodiez_frontend/models/recipe.dart';
import 'package:foodiez_frontend/services/client.dart';

class DioClient {

  Future<List<Recipe>> getRecipes() async {
    List<Recipe> recipes = [];
    try {
      Response response = await Client.dio.get('/recipes');
      // print((response.data as List));
      recipes = (response.data as List).map((recipe) {
        return Recipe.fromJson(recipe);
      }).toList();
    } on DioException catch (error) {
      print(error);
    }
    return recipes;
  }

  Future<Recipe> createRecipe({required Recipe recipe}) async {
    late Recipe retrievedRecipe;
    try {
      FormData data = FormData.fromMap({
        "name": recipe.name,
        "username": recipe.username,
        "ingredients": recipe.ingredients,
        "description": recipe.description,
        "category": recipe.category,
        "image": recipe.image,
        //await MultipartFile.fromFile(
          //recipe.image,
        //),
      });
      Response response = await Client.dio.post('/recipes', data: data);
      retrievedRecipe = Recipe.fromJson(response.data);
    } on DioException catch (error) {
      print(error);
    }
    return retrievedRecipe;
  }

  Future<Recipe> updateRecipe({required Recipe recipe}) async {
    late Recipe retrievedRecipe;
    try {
      FormData data = FormData.fromMap({
        "name": recipe.name,
        "username": recipe.username,
        "ingredients": recipe.ingredients,
        "description": recipe.description,
        "category": recipe.category,
        "image": recipe.image,
        //await MultipartFile.fromFile(recipe.image),
      });

      Response response =
          await Client.dio.put('/recipes/${recipe.id}', data: data);
      retrievedRecipe = Recipe.fromJson(response.data);
    } on DioException catch (error) {
      print(error);
    }
    return retrievedRecipe;
  }

  Future<void> deleteRecipe({required int recipeId}) async {
    try {
      await Client.dio.delete('/recipes/$recipeId');
    } on DioException catch (error) {
      print(error);
    }
  }
}