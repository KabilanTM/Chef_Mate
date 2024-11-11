class RecipeStep {
  final String description;
  final int time; // time in minutes for one person

  RecipeStep(this.description, this.time);
}

class Recipe {
  final String name;
  final List<RecipeStep> steps;

  Recipe(this.name, this.steps);
}

final List<Recipe> recipes = [
  Recipe("Chettinad Chicken", [
    RecipeStep("Marinate the chicken", 1),
    RecipeStep("Cook on medium heat", 1),
    RecipeStep("Add spices", 1),
  ]),
  // Add more recipes here
];
