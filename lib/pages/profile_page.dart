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
      extendBodyBehindAppBar: true, // Ensures the background extends behind the AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent AppBar
        elevation: 0,
        centerTitle: true, // Centers the title
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white, // White text
            fontSize: 24,
            fontWeight: FontWeight.bold,
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
                height: MediaQuery.of(context).size.height * 0.2,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 100),
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: const AssetImage('assets/Images/pfp.jpg'),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Hello, Chef',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white, // White text
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: const Text(
                  'Your Recipes:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White text
                  ),
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
                      color: Colors.white.withOpacity(0.9), // Slightly transparent white card
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      child: ListTile(
                        title: Text(
                          recipe["title"],
                          style: const TextStyle(color: Colors.black), // Black text inside the card
                        ),
                        subtitle: Text(
                          recipe["category"],
                          style: const TextStyle(color: Colors.black54), // Subdued black text
                        ),
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
        ],
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
        backgroundColor: const Color(0xFF70AD63),
        child: const Icon(Icons.add),
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
      size.width / 50,
      size.height - 50,
      size.width,
      size.height,
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
    path.moveTo(size.width, 0);
    path.quadraticBezierTo(size.width - 500, size.height / 2, 0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}