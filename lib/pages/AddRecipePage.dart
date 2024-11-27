import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key, this.recipe});
  final Map<String, dynamic>? recipe;

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final List<Map<String, String>> ingredients = [];
  final List<String> steps = [];
  final TextEditingController stepController = TextEditingController();
  String? selectedCategory;
  String? selectedIngredient;
  final TextEditingController ingredientAmountController =
      TextEditingController();

  final List<String> categoryNames = [
    'Main Dish',
    'Side Dish',
    'Dessert',
    'Beverages',
    'Smoothies',
    'Salad',
    'Vegan',
    'Vegetarian',
    'Keto'
  ];

  final Map<String, IconData> categoryIcons = {
    'Main Dish': Icons.restaurant,
    'Side Dish': Icons.fastfood,
    'Dessert': Icons.cake,
    'Beverages': Icons.local_drink,
    'Smoothies': Icons.local_cafe,
    'Salad': Icons.grass,
    'Vegan': Icons.nature_people,
    'Vegetarian': Icons.restaurant_menu,
    'Keto': Icons.local_dining,
  };

  void addIngredient() {
    if (selectedIngredient != null &&
        ingredientAmountController.text.isNotEmpty) {
      setState(() {
        ingredients.add({
          'ingredient': selectedIngredient!,
          'amount': ingredientAmountController.text,
        });
        selectedIngredient = null;
        ingredientAmountController.clear();
      });
    }
  }

  void addStep() {
    if (stepController.text.isNotEmpty) {
      setState(() {
        steps.add(stepController.text);
        stepController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Recipe'),
        backgroundColor: const Color.fromARGB(255, 112, 173, 99),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Recipe Title',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Enter recipe name',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Category',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              items: categoryNames
                  .map((category) => DropdownMenuItem(
                        value: category,
                        child: Row(
                          children: [
                            Icon(categoryIcons[category], color: Colors.green),
                            const SizedBox(width: 8),
                            Text(category),
                          ],
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Select a category',
              ),
            ),
            const SizedBox(height: 16),
            const Text('Description',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Enter recipe description',
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Ingredients',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<String>(
                    value: selectedIngredient,
                    items: [
                      'Eggs (pieces)',
                      'Milk (cups)',
                      'Sugar (cups)',
                      'Flour (grams)',
                      'Butter (tablespoons)',
                      'Salt (teaspoons)',
                      'Cheese (grams)',
                      'Chicken (grams)',
                      'Rice (cups)',
                      'Tomatoes (pieces)',
                    ]
                        .map((ingredient) => DropdownMenuItem(
                              value: ingredient,
                              child: Text(ingredient),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedIngredient = value;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Select ingredient',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: ingredientAmountController,
                    decoration: const InputDecoration(
                      hintText: 'Amount',
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: addIngredient,
                  icon: const Icon(Icons.add, color: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (ingredients.isNotEmpty)
              Column(
                children: ingredients.map((ingredient) {
                  return ListTile(
                    title: Text(
                        '${ingredient['ingredient']} - ${ingredient['amount']}'),
                  );
                }).toList(),
              ),
            const SizedBox(height: 16),
            const Text('Steps',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: stepController,
                    decoration: const InputDecoration(
                      hintText: 'Enter step',
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: addStep,
                  icon: const Icon(Icons.add, color: Colors.green),
                ),
              ],
            ),
            if (steps.isNotEmpty)
              Column(
                children: List.generate(
                  steps.length,
                  (index) => ListTile(
                    title: Text('${index + 1}. ${steps[index]}'),
                  ),
                ),
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty &&
                    selectedCategory != null &&
                    descriptionController.text.isNotEmpty &&
                    ingredients.isNotEmpty &&
                    steps.isNotEmpty) {
                  final recipe = {
                    'title': titleController.text,
                    'category': selectedCategory!,
                    'description': descriptionController.text,
                    'ingredients': ingredients,
                    'steps': steps,
                  };
                  //Pass data after pop
                  context.pop(recipe);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all fields')),
                  );
                }
              },
              child: const Text('Create Recipe'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 112, 173, 99),
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
