class Recipe {
  String? id;
  String name;
  String username;
  List<dynamic> ingredients;
  String? description;
  String category;
  String? image;
  List<dynamic>? steps;

  Recipe(
      {
        this.id,
        required this.name,
        required this.username,
        required this.ingredients,
        this.description,
        required this.category,
        this.image,
        this.steps
      }
    );

  Recipe.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        name = json['name'] as String,
        username = json['userId']['username'] as String,
        ingredients = json['ingredients'] as List<dynamic>,
        description = json['description'] as String?,
        category = json['category'] as String,
        image = json['image'] as String?,
        steps = json['steps'] as List<dynamic>;
  
  Recipe.fromJson2(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        name = json['name'] as String,
        username = json['username'] as String,
        ingredients = json['ingredients'] as List<dynamic>,
        description = json['description'] as String?,
        category = json['category'] as String,
        image = json['image'] as String?,
        steps = json['steps'] as List<dynamic>;
}
