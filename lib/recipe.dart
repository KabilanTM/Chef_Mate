class Ingredient {
  final String item;
  final String quantity;
  final String unit;

  Ingredient({
    required this.item,
    required this.quantity,
    required this.unit,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      item: json['item'],
      quantity: json['quantity'],
      unit: json['unit'],
    );
  }
}

class Recipe {
  final String name;
  final String category;
  final String cuisine;
  final int servings;
  final List<Ingredient> ingredients;
  final List<List<dynamic>> steps;

  Recipe({
    required this.name,
    required this.category,
    required this.cuisine,
    required this.servings,
    required this.ingredients,
    required this.steps,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    var ingredientsList = (json['ingredients'] as List)
        .map((ingredient) => Ingredient.fromJson(ingredient))
        .toList();

    var stepsList = List<List<dynamic>>.from(json['steps']);

    return Recipe(
      name: json['name'],
      category: json['category'],
      cuisine: json['cuisine'],
      servings: json['servings'],
      ingredients: ingredientsList,
      steps: stepsList,
    );
  }
}
