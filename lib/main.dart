import 'package:flutter/material.dart';
import 'package:foodiez_frontend/pages/home_page.dart';
import 'package:foodiez_frontend/pages/recipes_page.dart';
import 'package:foodiez_frontend/pages/signin_page.dart';
import 'package:foodiez_frontend/pages/signup_page.dart';
import 'package:foodiez_frontend/pages/categories_page.dart';
import 'package:foodiez_frontend/pages/favorites_page.dart';
import 'package:foodiez_frontend/pages/profile_page.dart';
import 'package:go_router/go_router.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      initialLocation: '/mainscreen', // Main page
      routes: [
        GoRoute(
          path: '/signin',
          builder: (context, state) => SignInPage(),
        ),
        GoRoute(
          path: '/signup',
          builder: (context, state) => SignUpPage(),
        ),
        GoRoute(
          path: '/mainscreen',
          builder: (context, state) => const MainScreen(),
        ),
        GoRoute(
          path: '/recipes',
          builder: (context, state) => RecipesPage(),
        ),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0; // Track the selected tab index

  // List of pages for each tab
  final List<Widget> pages = [
    const HomePage(), // Home page content
    CategoriesPage(), // Categories page content
    const FavoritesPage(), // Favorites page content
    ProfilePage(), // Profile page content
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index; // Update the selected tab
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: const Color(0xFFB39DDB),
        unselectedItemColor: Colors.grey,
        onTap: onItemTapped,
      ),
    );
  }
}
