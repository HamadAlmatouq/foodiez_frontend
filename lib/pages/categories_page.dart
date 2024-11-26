import 'package:flutter/material.dart';
import 'package:foodiez_frontend/pages/widgets/categoriesList.dart';
import 'package:foodiez_frontend/pages/widgets/category_card.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: const Color.fromARGB(255, 112, 173, 99),
      ),
      body: Container(
        // Correctly applying the gradient background to a Container widget
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 112, 173, 99),
              Color.fromARGB(255, 255, 255, 255),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 cards per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return CategoryCard(
              name: category['name'],
              count: category['count'],
              onTap: () {
                // Navigate to a specific category page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryDetailPage(category['name']),
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

// Dummy category detail page
class CategoryDetailPage extends StatelessWidget {
  final String categoryName;

  const CategoryDetailPage(this.categoryName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Center(
        child: Text(
          'Recipes for $categoryName',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
