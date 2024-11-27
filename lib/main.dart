import 'package:flutter/material.dart';
import 'package:foodiez_frontend/pages/home_page.dart';
import 'package:foodiez_frontend/pages/recipes_page.dart';
import 'package:foodiez_frontend/pages/signin_page.dart';
import 'package:foodiez_frontend/pages/signup_page.dart';
import 'package:foodiez_frontend/pages/test_page.dart';
import 'package:foodiez_frontend/pages/categories_page.dart';
import 'package:foodiez_frontend/pages/favorites_page.dart';
import 'package:foodiez_frontend/pages/profile_page.dart';
import 'package:foodiez_frontend/providers/auth_provider.dart';
import 'package:foodiez_frontend/providers/recipe_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<RecipesProvider>(create: (_) => RecipesProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      initialLocation: '/mainscreen', 
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
        GoRoute(
          path: '/test',
          builder: (context, state) => const TestPage(),
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
  int selectedIndex = 0; 

  final List<Widget> pages = [
    const HomePage(), 
    CategoriesPage(), 
    const FavoritesPage(), 
    ProfilePage(), 
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex], 
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
