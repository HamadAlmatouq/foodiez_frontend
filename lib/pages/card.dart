import 'package:flutter/material.dart';
import 'package:foodiez_frontend/models/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const RecipeCard({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // Expanded(
          //   child: Image.network(
          //     recipe.image,
          //     fit: BoxFit.cover,
          //     width: double.infinity,
          //   ),
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(recipe.name),
                  Text("Username: ${recipe.username}"),
                  // Text("Ingredients: ${recipe.ingredients}"),
                  Text("Category: ${recipe.category}"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {
                            // GoRouter.of(context).push('/update/${recipe.id}');
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            // Provider.of<RecipesProvider>(context, listen: false)
                            //     .deleteRecipe(recipe.id!);
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
