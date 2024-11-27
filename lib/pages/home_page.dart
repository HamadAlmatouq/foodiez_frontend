import 'package:flutter/material.dart';
import 'package:foodiez_frontend/main.dart';
import 'package:foodiez_frontend/models/recipe.dart';
import 'package:foodiez_frontend/pages/widgets/search_bar.dart' as custom;
import 'package:foodiez_frontend/pages/widgets/recipe_card.dart';
import 'package:foodiez_frontend/providers/recipe_provider.dart';
import 'package:foodiez_frontend/recipes_data.dart';
import 'package:foodiez_frontend/pages/recipe_detail_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final String? username; 

  const HomePage({Key? key, this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final highRatedRecipes =
        recipes.where((recipe) => recipe['rating'] >= 4.5).toList();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 112, 173, 99),
              Color.fromARGB(255, 255, 255, 255),
            ],
            stops: [0.0, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 90), 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good morning ...\n ${username ?? 'Abdulwahab 💪🏻'}',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Explore new healthy recipes',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const custom.SearchBar(),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Color.fromARGB(255, 255, 255, 255),
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'High Rated Recipes',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(221, 255, 255, 255),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Color.fromARGB(255, 255, 255, 255),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 0),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: FutureBuilder(
                  future: context.read<RecipesProvider>().getRecipes(),
                  builder: (context, dataSnapshot) {
                    return Consumer<RecipesProvider>(
                      builder: (context, provider, child) {
                        return GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, 
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 3 / 4, 
                          ),
                          itemCount: provider.recipes.length,
                          itemBuilder: (context, index) {
                            final recipe = provider.recipes[index];
                            return RecipeCard(
                              image: '',
                              title: recipe.name,
                              category: recipe.category,
                              chef: recipe.username,
                              calories: 0,
                              likes: 0,
                              onTap: () {
                                Navigator.push( //how about router?
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        RecipeDetailPage(recipe: recipe),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }
                    );
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}