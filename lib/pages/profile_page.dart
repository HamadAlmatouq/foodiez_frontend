import 'package:flutter/material.dart';
import 'package:foodiez_frontend/pages/recipe_detail_page.dart';
import 'package:foodiez_frontend/providers/auth_provider.dart';
import 'package:foodiez_frontend/providers/recipe_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<Map<String, dynamic>> recipes = [];
  String username = '';
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
        child: Consumer<AuthProvider>(
          builder: (context, provider, child) {
            username = (provider.user == null) ? '' : provider.user!.username;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                const Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/Images/pfp.jpg'),
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    'Hello, ${(provider.user == null) ? 'chef' : provider.user!.username}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Your Recipes:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Consumer<RecipesProvider>(
                    builder: (context, provider, child) {
                      var rc = provider.recipes.where((recipe) => recipe.username == username).toList();
                      return ListView.builder(
                        itemCount: rc.length,
                        itemBuilder: (context, index) {
                          final recipe = rc[index];
                          return Card(
                            margin:
                                const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                            child: ListTile(
                              title: Text(recipe.name),
                              subtitle: Text(recipe.category),
                              onTap: () {
                                Navigator.push( //how about router?
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            RecipeDetailPage(recipe: recipe),
                                      ),
                                    );
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
                                      // _deleteRecipe(index);
                                      provider.deleteRecipe(recipe.id!);
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Deleted Recipe successfully")));
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  ),
                ),
              ],
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (username.isNotEmpty) {
            final recipe = await context.push<Map<String, dynamic>>(
              '/add-recipe',
            );
            if (recipe != null) {
              _addRecipe(recipe);
            }
          }
          else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("You need to sign in first")));
          }
        },
        backgroundColor: const Color.fromARGB(255, 112, 173, 99),
        child: const Icon(Icons.add),
      ),
    );
  }
}
