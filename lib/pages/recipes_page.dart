import 'package:flutter/material.dart';
import 'package:foodiez_frontend/pages/widgets/recipe_card.dart';
import 'package:foodiez_frontend/pages/recipe_detail_page.dart';

class RecipesPage extends StatelessWidget {
  final List<Map<String, dynamic>> recipes = [
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Spaghetti Carbonara',
      'category': 'Main Dish',
      'chef': 'Chef Mario',
      'calories': 600,
      'likes': 120,
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Caesar Salad',
      'category': 'MainDish',
      'chef': 'Chef Anna',
      'calories': 300,
      'likes': 85,
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Chocolate Cake',
      'category': 'MainDish',
      'chef': 'Chef Clara',
      'calories': 450,
      'likes': 200,
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Green Smoothie',
      'category': 'Smoothies',
      'chef': 'Chef John',
      'calories': 150,
      'likes': 60,
    },
  ];

   RecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
        backgroundColor: const Color.fromARGB(255, 112, 173, 99),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return RecipeCard(
              image: recipe['image'],
              title: recipe['title'],
              category: recipe['category'],
              chef: recipe['chef'],
              calories: recipe['calories'],
              likes: recipe['likes'],
              onTap: () {
              },
            );
          },
        ),
      ),
    );
  }
}