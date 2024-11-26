import 'package:flutter/material.dart';
import 'package:foodiez_frontend/pages/signin_page.dart';
import 'package:foodiez_frontend/pages/signup_page.dart';
import 'package:foodiez_frontend/pages/test_page.dart';
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
    final GoRouter _router = GoRouter(
      initialLocation: '/signin', //Main page
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
          path: '/test',
          builder: (context, state) => TestPage(),
        ),
      ],
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
