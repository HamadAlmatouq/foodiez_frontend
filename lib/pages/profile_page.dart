import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<Map<String, String>> recipes = [
    {"id": "1", "title": "Avocado Toast"},
    {"id": "2", "title": "Grilled Chicken Salad"},
    {"id": "3", "title": "Berry Smoothie"}
  ];

  // Method to add a new recipe
  void _addRecipe(Map<String, String> recipe) {
    setState(() {
      recipes.add({
        "id": (recipes.length + 1).toString(),
        "title": recipe["title"] ?? "Untitled Recipe",
      });
    });
  }

  // Method to handle editing a recipe
  void _editRecipe(Map<String, String> recipe) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Edit ${recipe['title']}')),
    );
  }

  // Method to handle deleting a recipe
  void _deleteRecipe(Map<String, String> recipe) {
    setState(() {
      recipes.removeWhere((r) => r['id'] == recipe['id']);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Deleted ${recipe['title']}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color.fromARGB(255, 112, 173, 99),
        centerTitle: true,
      ),
      body: Container(
        // Gradient background
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Center(
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/Images/pfp.jpg',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Hello, Chef',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Your Recipes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Recipe Cards
              Expanded(
                child: ListView.builder(
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = recipes[index];
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              recipe['title'] ?? 'Untitled Recipe',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  color: Colors.green,
                                  onPressed: () => _editRecipe(recipe),
                                ),
                                const SizedBox(width: 8),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  color: Colors.red,
                                  onPressed: () => _deleteRecipe(recipe),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // Add Recipe Button (Floating Action Button)
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to AddRecipePage and await the result
          final newRecipe =
              await context.push<Map<String, String>>('/add-recipe');
          if (newRecipe != null) {
            _addRecipe(newRecipe);
          }
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 112, 173, 99),
      ),
    );
  }
}
