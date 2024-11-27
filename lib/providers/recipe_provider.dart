import 'package:flutter/material.dart';
import 'package:foodiez_frontend/models/recipe.dart';
import 'package:foodiez_frontend/services/recipes.dart';

class RecipesProvider extends ChangeNotifier {
  List<Recipe> recipes = [];

  Future<List<Recipe>> getRecipes() async {
    // print("getting recipes");
    recipes = await DioClient().getRecipes();
    return recipes;
  }

  void createRecipe(Recipe recipe) async {
    Recipe newRecipe = await DioClient().createRecipe(recipe: recipe);
    recipes.insert(0, newRecipe);
    notifyListeners();
  }

  void updateRecipe(Recipe recipe) async {
    Recipe newRecipe = await DioClient().updateRecipe(recipe: recipe);
    int index = recipes.indexWhere((recipe) => recipe.id == newRecipe.id);
    recipes[index] = newRecipe;
    notifyListeners();
  }

  void deleteRecipe(int recipeId) async {
    await DioClient().deleteRecipe(recipeId: recipeId);
    recipes.removeWhere((recipe) => recipe.id == recipeId);
    notifyListeners();
  }
}

void main() {
  RecipesProvider provider = RecipesProvider();
  provider.getRecipes();
  print(provider.recipes);
}