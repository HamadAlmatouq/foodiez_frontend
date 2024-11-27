// // import 'package:flutter/material.dart';
// // import 'package:foodiez_frontend/pages/widgets/search_bar.dart' as custom;
// // import 'package:foodiez_frontend/pages/widgets/recipe_card.dart';
// // import 'package:foodiez_frontend/providers/recipe_provider.dart';
// // import 'package:foodiez_frontend/pages/recipe_detail_page.dart';
// // import 'package:provider/provider.dart';
// // import 'package:carousel_slider/carousel_slider.dart';

// // class HomePage extends StatelessWidget {
// //   final String? username;

// //   const HomePage({Key? key, this.username}) : super(key: key);

// //   String _getGreeting() {
// //     final hour = DateTime.now().hour;
// //     if (hour < 12) {
// //       return 'Good Morning,';
// //     } else if (hour < 18) {
// //       return 'Good Afternoon,';
// //     } else {
// //       return 'Good Evening,';
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final highRatedRecipes = context.watch<RecipesProvider>().recipes;
// //     final List<String> carouselImages = [
// //       'assets/Images/smoothie.jpg',
// //       'assets/Images/smoothie.jpg',
// //       'assets/Images/smoothie.jpg',
// //     ];

// //     return Scaffold(
// //       extendBodyBehindAppBar: true,
// //       appBar: AppBar(
// //         backgroundColor: Colors.transparent,
// //         elevation: 0,
// //       ),
// //       body: Container(
// //         decoration: const BoxDecoration(
// //           gradient: LinearGradient(
// //             colors: [
// //               Color.fromARGB(255, 112, 173, 99),
// //               Color.fromARGB(255, 255, 255, 255),
// //             ],
// //             stops: [0.0, 1.0],
// //             begin: Alignment.topCenter,
// //             end: Alignment.bottomCenter,
// //           ),
// //         ),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             const SizedBox(height:90),
// //             // Carousel Slider
// //             CarouselSlider(
// //               items: carouselImages
// //                   .map((image) => ClipRRect(
// //                         borderRadius: BorderRadius.circular(12),
// //                         child: Image.asset(
// //                           image,
// //                           fit: BoxFit.cover,
// //                           width: double.infinity,
// //                         ),
// //                       ))
// //                   .toList(),
// //               options: CarouselOptions(
// //                 height: 100,
// //                 autoPlay: true,
// //                 enlargeCenterPage: true,
// //                 aspectRatio: 16 / 9,
// //                 autoPlayInterval: const Duration(seconds: 3),
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   // Dynamic Greeting
// //                 Text(
// //                     _getGreeting(),
// //                     style: const TextStyle(
// //                       fontSize: 36, // Larger font size for the greeting
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 0),
// //                   Text(
// //                     username ?? 'Abdulwahab 💪🏻', // Username
// //                     style: const TextStyle(
// //                       fontSize: 28, // Slightly smaller font size for the username
// //                       fontWeight: FontWeight.w500, // Medium weight for contrast
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 10),
// //                   const Text(
// //                     'Explore new healthy recipes',
// //                     style: TextStyle(
// //                       fontSize: 16,
// //                       color: Color.fromARGB(245, 255, 255, 255),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 20),
// //                   const custom.SearchBar(), // Search Bar
// //                   const SizedBox(height: 30),
// //                   const Row(
// //                     children: [
// //                       Expanded(
// //                         child: Divider(
// //                           color: Colors.white,
// //                           thickness: 1,
// //                         ),
// //                       ),
// //                       Padding(
// //                         padding: EdgeInsets.symmetric(horizontal: 8.0),
// //                         child: Text(
// //                           'Popular Recipes',
// //                           style: TextStyle(
// //                             fontSize: 20,
// //                             fontWeight: FontWeight.bold,
// //                             color: Colors.white,
// //                           ),
// //                         ),
// //                       ),
// //                       Expanded(
// //                         child: Divider(
// //                           color: Colors.white,
// //                           thickness: 1,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   const SizedBox(height: 20),
// //                 ],
// //               ),
// //             ),
// //             // Popular Recipes Horizontal List
// //             SizedBox(
// //               height: 200,
// //               child: FutureBuilder(
// //                 future: context.read<RecipesProvider>().getRecipes(),
// //                 builder: (context, dataSnapshot) {
// //                   return Consumer<RecipesProvider>(
// //                     builder: (context, provider, child) {
// //                       return ListView.builder(
// //                         scrollDirection: Axis.horizontal,
// //                         itemCount: provider.recipes.length,
// //                         itemBuilder: (context, index) {
// //                           final recipe = provider.recipes[index];
// //                           return Padding(
// //                             padding: const EdgeInsets.symmetric(horizontal: 8.0),
// //                             child: RecipeCard(
// //                               image: recipe.image ?? 'assets/Images/D1.png',
// //                               title: recipe.name,
// //                               category: recipe.category,
// //                               chef: recipe.username,
// //                               calories: 0,
// //                               likes: 0,
// //                               onTap: () {
// //                                 Navigator.push(
// //                                   context,
// //                                   MaterialPageRoute(
// //                                     builder: (context) =>
// //                                         RecipeDetailPage(recipe: recipe),
// //                                   ),
// //                                 );
// //                               },
// //                             ),
// //                           );
// //                         },
// //                       );
// //                     },
// //                   );
// //                 },
// //               ),
// //             ),
// //             const Spacer(), // Push content above navigation bar
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:foodiez_frontend/pages/widgets/search_bar.dart' as custom;
// import 'package:foodiez_frontend/pages/widgets/recipe_card.dart';
// import 'package:foodiez_frontend/providers/recipe_provider.dart';
// import 'package:foodiez_frontend/pages/recipe_detail_page.dart';
// import 'package:provider/provider.dart';
// import 'package:carousel_slider/carousel_slider.dart';

// class HomePage extends StatelessWidget {
//   final String? username;

//   const HomePage({Key? key, this.username}) : super(key: key);

//   String _getGreeting() {
//     final hour = DateTime.now().hour;
//     if (hour < 12) {
//       return 'Good Morning,';
//     } else if (hour < 18) {
//       return 'Good Afternoon,';
//     } else {
//       return 'Good Evening,';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final highRatedRecipes = context.watch<RecipesProvider>().recipes;
//     final List<String> carouselImages = [
//       'assets/Images/smoothie.jpg',
//       'assets/Images/smoothie.jpg',
//       'assets/Images/smoothie.jpg',
//     ];

//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Stack(
//         children: [
//           // Custom Shape Background
//           ClipPath(
//             clipper: CustomBackgroundClipper(),
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.5,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color.fromARGB(255, 112, 173, 99),
//                     Color.fromARGB(255, 182, 229, 173),
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//               ),
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 90),
//               // Carousel Slider
//               CarouselSlider(
//                 items: carouselImages
//                     .map((image) => ClipRRect(
//                           borderRadius: BorderRadius.circular(12),
//                           child: Image.asset(
//                             image,
//                             fit: BoxFit.cover,
//                             width: double.infinity,
//                           ),
//                         ))
//                     .toList(),
//                 options: CarouselOptions(
//                   height: 100,
//                   autoPlay: true,
//                   enlargeCenterPage: true,
//                   aspectRatio: 16 / 9,
//                   autoPlayInterval: const Duration(seconds: 3),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Dynamic Greeting
//                     Text(
//                       _getGreeting(),
//                       style: const TextStyle(
//                         fontSize: 36,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     const SizedBox(height: 0),
//                     Text(
//                       username ?? 'Abdulwahab 💪🏻',
//                       style: const TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.white,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     const Text(
//                       'Explore new healthy recipes',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white70,
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     const custom.SearchBar(), // Search Bar
//                     const SizedBox(height: 30),
//                     const Row(
//                       children: [
//                         Expanded(
//                           child: Divider(
//                             color: Colors.white,
//                             thickness: 1,
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 8.0),
//                           child: Text(
//                             'Popular Recipes',
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Divider(
//                             color: Colors.white,
//                             thickness: 1,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//               // Popular Recipes Horizontal List
//               SizedBox(
//                 height: 200,
//                 child: FutureBuilder(
//                   future: context.read<RecipesProvider>().getRecipes(),
//                   builder: (context, dataSnapshot) {
//                     return Consumer<RecipesProvider>(
//                       builder: (context, provider, child) {
//                         return ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           itemCount: provider.recipes.length,
//                           itemBuilder: (context, index) {
//                             final recipe = provider.recipes[index];
//                             return Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 8.0),
//                               child: RecipeCard(
//                                 image: recipe.image ?? 'assets/Images/D1.png',
//                                 title: recipe.name,
//                                 category: recipe.category,
//                                 chef: recipe.username,
//                                 calories: 0,
//                                 likes: 0,
//                                 onTap: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) =>
//                                           RecipeDetailPage(recipe: recipe),
//                                     ),
//                                   );
//                                 },
//                               ),
//                             );
//                           },
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//               const Spacer(), // Push content above navigation bar
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Custom Clipper for Background
// class CustomBackgroundClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height * 0.8);
//     path.quadraticBezierTo(
//         size.width * 0.5, size.height, size.width, size.height * 0.2);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
import 'package:flutter/material.dart';
import 'package:foodiez_frontend/pages/widgets/search_bar.dart' as custom;
import 'package:foodiez_frontend/pages/widgets/recipe_card.dart';
import 'package:foodiez_frontend/providers/recipe_provider.dart';
import 'package:foodiez_frontend/pages/recipe_detail_page.dart';
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
    final highRatedRecipes = context.watch<RecipesProvider>().recipes;
    final List<String> carouselImages = [
      'assets/Images/smoothie.jpg',
      'assets/Images/smoothie.jpg',
      'assets/Images/smoothie.jpg',
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Top Green Shape
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
          // Bottom Green Shape
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
              // Carousel Slider
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
                  autoPlayInterval: const Duration(seconds: 3),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dynamic Greeting
                    Text(
                      _getGreeting(),
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 0),
                    Text(
                      username ?? 'Abdulwahab 💪🏻',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Explore new healthy recipes',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const custom.SearchBar(), // Search Bar
                    const SizedBox(height: 30),
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.white,
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
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              // Popular Recipes Horizontal List
              SizedBox(
                height: 200,
                child: FutureBuilder(
                  future: context.read<RecipesProvider>().getRecipes(),
                  builder: (context, dataSnapshot) {
                    return Consumer<RecipesProvider>(
                      builder: (context, provider, child) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: provider.recipes.length,
                          itemBuilder: (context, index) {
                            final recipe = provider.recipes[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: RecipeCard(
                                image: recipe.image ?? 'assets/Images/D1.png',
                                title: recipe.name,
                                category: recipe.category,
                                chef: recipe.username,
                                calories: 0,
                                likes: 0,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          RecipeDetailPage(recipe: recipe),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
              const Spacer(), // Push content above navigation bar
            ],
          ),
        ],
      ),
    );
  }
}

// Top Clipper
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

// Bottom Clipper
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