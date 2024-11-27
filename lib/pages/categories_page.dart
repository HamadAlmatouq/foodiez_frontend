import 'package:flutter/material.dart';
import 'package:foodiez_frontend/pages/widgets/categoriesList.dart';
import 'package:foodiez_frontend/pages/widgets/category_card.dart';
import 'package:foodiez_frontend/pages/widgets/recipe_card.dart';
import 'package:foodiez_frontend/recipes_data.dart';
import 'package:foodiez_frontend/models/recipe.dart';
import 'package:foodiez_frontend/pages/recipe_detail_page.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Ensures the background extends behind the AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0, // Remove shadow
        centerTitle: true, // Centers the title
        title: const Padding(
          padding: EdgeInsets.only(top: 20.0), // Pushes text downward
          child: Text(
            'Categories',
            style: TextStyle(
              color: Colors.white, // Change text color to white
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Top Background Shape
          ClipPath(
            clipper: TopClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF70AD63),
                    Color.fromARGB(255, 182, 229, 173),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          // Bottom Background Shape
          Align(
            alignment: Alignment.bottomRight,
            child: ClipPath(
              clipper: BottomRightClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF70AD63),
                      Color.fromARGB(255, 182, 229, 173),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120.0), // Adjust padding to account for title
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryCard(
                  name: category['name'],
                  imagePath: category['image'], // Add image path here
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CategoryDetailPage(category['name']),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryDetailPage extends StatelessWidget {
  final String categoryName;

  const CategoryDetailPage(this.categoryName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryRecipes = recipes
        .where((recipe) =>
            categoryName == 'All Recipes' || recipe['category'] == categoryName)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: const Color(0xFF70AD63), // Pastel green
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: categoryRecipes.isEmpty
            ? const Center(
                child: Text(
                  'No recipes found for this category.',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            : ListView.builder(
                itemCount: categoryRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = categoryRecipes[index];
                  return RecipeCard(
                    image: recipe['image'],
                    title: recipe['title'],
                    category: recipe['category'],
                    chef: recipe['chef'],
                    calories: recipe['calories'],
                    likes: recipe['likes'],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RecipeDetailPage(recipe: Recipe.fromJson(recipe)),
                        ),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}

// Top Clipper
class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width / 100,
      size.height - 100,
      size.width /1,
      size.height -300,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// Bottom-Right Clipper
class BottomRightClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, 30);
    path.quadraticBezierTo(size.width - 10, size.height / 22, 0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}