import 'package:flutter/material.dart';
import 'package:foodiez_frontend/pages/widgets/search_bar.dart' as custom;
import 'package:foodiez_frontend/pages/widgets/recipe_card.dart';
import 'package:foodiez_frontend/recipes_data.dart';
import 'package:foodiez_frontend/pages/recipe_detail_page.dart';

class HomePage extends StatelessWidget {
  final String? username; // Pass the username to this widget

  const HomePage({Key? key, this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter high-rated recipes (rating >= 4.5)
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
            const SizedBox(height: 60), // Reduced spacing at the top
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good morning, \n ${username ?? 'Wahab 💪 '}',
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
                  // SearchBar with white outline
                  const custom.SearchBar(),
                  const SizedBox(height: 20),
                  // Centered High Rated Recipes with horizontal lines
                  Row(
                    children: const [
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
                  const SizedBox(height: 10),
                ],
              ),
            ),
            // High-rated recipes grid (Scrollable)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two cards per row
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio:
                        3 / 4, // Adjust aspect ratio to match card dimensions
                  ),
                  itemCount: highRatedRecipes.length,
                  itemBuilder: (context, index) {
                    final recipe = highRatedRecipes[index];
                    return RecipeCard(
                      image: recipe['image'],
                      title: recipe['title'],
                      category: recipe['category'],
                      chef: recipe['chef'],
                      calories: recipe['calories'],
                      likes: recipe['likes'],
                      onTap: () {
                        // Navigate to the RecipeDetailPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RecipeDetailPage(recipe: recipe),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
