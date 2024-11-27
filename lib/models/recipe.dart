class Recipe {
  String? id;
  String name;
  String username;
  List<dynamic> ingredients;
  String? description;
  String category;
  String? image;

  Recipe(
      {
        this.id,
        required this.name,
        required this.username,
        required this.ingredients,
        this.description,
        required this.category,
        this.image
      }
    );

  Recipe.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        name = json['name'] as String,
        username = json['userId']['username'] as String,
        ingredients = json['ingredients'] as List<dynamic>,
        description = json['description'] as String?,
        category = json['category'] as String,
        image = json['image'] as String?;
}
