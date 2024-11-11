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

  Recipe("Falafel", [
    RecipeStep("Soak beans in water for 24 hours", 1440),
    RecipeStep("Blend beans with garlic powder and salt", 5),
    RecipeStep("Shape mixture into circles", 5),
    RecipeStep("Fry until golden brown", 10),
  ]),

  Recipe("Potato Pakora", [
    RecipeStep("Combine potatoes, flour, onion, chili, and spices in a bowl", 5),
    RecipeStep("Shape mixture as desired", 5),
    RecipeStep("Fry in oil until golden brown", 10),
  ]),

  Recipe("Root Vegetable Biryani", [
    RecipeStep("Add chopped vegetables to pan and cover with boiling water", 5),
    RecipeStep("Simmer for 15 minutes", 15),
    RecipeStep("Add curry powder and chat masala, cook for 2 minutes", 2),
    RecipeStep("Add rice and cook until liquid is absorbed", 20),
    RecipeStep("Garnish with chopped coriander", 1),
  ]),

  Recipe("Chicken Pakora", [
    RecipeStep("Mix chicken, flour, garlic, spices, and water in a bowl", 5),
    RecipeStep("Deep fry until golden brown", 10),
  ]),

  Recipe("Balti Chicken", [
    RecipeStep("Chop onions and cook until light brown", 10),
    RecipeStep("Add tomatoes, chicken, spices, and fry on medium heat", 15),
    RecipeStep("Stir occasionally until cooked", 20),
  ]),

  Recipe("Mango Sorbet", [
    RecipeStep("Blend mango, sweetener, and yogurt until smooth", 5),
    RecipeStep("Freeze for 2-3 hours until sides are set", 180),
    RecipeStep("Beat and return to freezer until firm", 240),
    RecipeStep("Garnish with fresh mango slices", 2),
  ]),

  Recipe("Chum Chums", [
    RecipeStep("Prepare paneer and shape into balls", 60),
    RecipeStep("Boil milk, add lemon juice, and separate curds from whey", 15),
    RecipeStep("Drain curds and press under heavy pan", 60),
    RecipeStep("Fry paneer balls until golden brown", 10),
    RecipeStep("Soak in sugar syrup", 15),
  ]),

  Recipe("Kheer (Rice Pudding)", [
    RecipeStep("Boil rice in water until soft", 20),
    RecipeStep("Add sugar and cardamom for flavor", 5),
    RecipeStep("Add milk and bring to boil", 10),
    RecipeStep("Simmer until creamy", 15),
  ]),

  Recipe("Hotpot", [
    RecipeStep("Preheat oven to 180°C", 5),
    RecipeStep("Brown lamb pieces in a pan", 5),
    RecipeStep("Cook onions with salt for 2-3 minutes", 3),
    RecipeStep("Add flour, stock, thyme, bay leaves, and Worcestershire sauce", 10),
    RecipeStep("Layer ingredients in casserole dish with potatoes", 10),
    RecipeStep("Cook in oven for 40 minutes until golden brown", 40),
  ]),
];
