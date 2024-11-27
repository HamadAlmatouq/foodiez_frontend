import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<Map<String, dynamic>> recipes = [];

  void _addRecipe(Map<String, dynamic> recipe) {
    setState(() {
      recipes.add({
        "id": recipes.length + 1,
        "title": recipe["title"] ?? "Untitled Recipe",
        "category": recipe["category"],
        "description": recipe["description"],
        "ingredients": recipe["ingredients"],
        "steps": recipe["steps"]
      });
    });
  }

  void _updateRecipe(int index, Map<String, dynamic> updatedRecipe) {
    setState(() {
      recipes[index] = updatedRecipe;
    });
  }

  void _deleteRecipe(int index) {
    setState(() {
      recipes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color.fromARGB(255, 112, 173, 99),
      ),
      body: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/Images/pfp.jpg'),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'Hello, Chef',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'Your Recipes:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: ListTile(
                      title: Text(recipe["title"]),
                      subtitle: Text(recipe["category"]),
                      onTap: () {
                        context.push('/recipe/${recipe["id"]}');
                      },
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () async {
                              final updatedRecipe =
                                  await context.push<Map<String, dynamic>>(
                                '/add-recipe',
                                extra: recipe,
                              );
                              if (updatedRecipe != null) {
                                _updateRecipe(index, updatedRecipe);
                              }
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _deleteRecipe(index);
                            },
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final recipe = await context.push<Map<String, dynamic>>(
            '/add-recipe',
          );
          if (recipe != null) {
            _addRecipe(recipe);
          }
        },
        backgroundColor: const Color.fromARGB(255, 112, 173, 99),
        child: const Icon(Icons.add),
      ),
    );
  }
}
