
import 'package:flutter/material.dart';
import 'package:foodiez_frontend/pages/widgets/search_bar.dart' as custom;
import 'package:foodiez_frontend/pages/widgets/recipe_card.dart';
import 'package:foodiez_frontend/providers/auth_provider.dart';
import 'package:foodiez_frontend/providers/recipe_provider.dart';
import 'package:foodiez_frontend/pages/recipe_detail_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  final String? username;

  const HomePage({Key? key, this.username}) : super(key: key);

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning,';
    } else if (hour < 18) {
      return 'Good Afternoon,';
    } else {
      return 'Good Evening,';
    }
  }

  @override
  Widget build(BuildContext context) {
    // final highRatedRecipes = context.watch<RecipesProvider>().recipes;
    final List<String> carouselImages = [
      'assets/Images/IMG_8526.jpg',
      'assets/Images/Screenshot 2024-11-28 at 8.46.07 AM.png',
      'assets/Images/IMG_8536.jpg',
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: TopClipper(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 112, 173, 99),
                    Color.fromARGB(255, 182, 229, 173),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: BottomClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 112, 173, 99),
                      Color.fromARGB(255, 182, 229, 173),
                    ],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 90),
              CarouselSlider(
                items: carouselImages
                    .map((image) => ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 100,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: const Duration(seconds: 4),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getGreeting(),
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 0),
                    // Text(
                    //   username ?? 'Guest 💪🏻',
                    //   style: const TextStyle(
                    //     fontSize: 28,
                    //     fontWeight: FontWeight.w500,
                    //     color: Colors.white,
                    //   ),
                    // ),
                    const SizedBox(height: 10),
                    const Text(
                      'Explore new healthy recipes',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const custom.SearchBar(), 
                    const SizedBox(height: 30),
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Color(0xFFB39DDB),
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Popular Recipes',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFB39DDB),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color(0xFFB39DDB),
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: FutureBuilder(
                    future: Provider.of<RecipesProvider>(context, listen: false).getRecipes(),
                    builder: (context, dataSnapshot) {
                      return Consumer<RecipesProvider>(
                        builder: (context, provider, child) {
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
                                    image: recipe.image,
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
                                }
                              );
                            }
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              // const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height * 0.6,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.4);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height * 0.6,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}