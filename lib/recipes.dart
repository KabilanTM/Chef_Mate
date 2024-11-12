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
    RecipeStep(
        "Marinate the chicken with yogurt, turmeric, red chili powder, and salt. Leave it to rest for at least 30 minutes.",
        30),
    RecipeStep(
        "Heat oil in a pan and add mustard seeds, curry leaves, and dried red chilies. Sauté until fragrant.",
        5),
    RecipeStep("Add chopped onions and cook until they turn golden brown.", 10),
    RecipeStep(
        "Add the marinated chicken and cook on medium heat until it turns golden on the outside.",
        10),
    RecipeStep(
        "Add ginger-garlic paste, ground spices, and tomatoes. Cook until tomatoes are softened.",
        10),
    RecipeStep(
        "Cover and simmer for 15 minutes until chicken is fully cooked and tender.",
        15),
  ]),
  Recipe("Falafel", [
    RecipeStep(
        "Soak dried chickpeas in water for at least 24 hours to soften.", 1440),
    RecipeStep(
        "Drain the chickpeas and blend them with garlic, parsley, coriander, cumin, salt, and pepper until coarsely ground.",
        10),
    RecipeStep(
        "Shape the mixture into small round patties, ensuring they're tightly packed.",
        5),
    RecipeStep(
        "Heat oil in a pan and fry falafel patties until golden brown on both sides.",
        10),
    RecipeStep(
        "Drain on paper towels and serve hot with tahini sauce or hummus.", 5),
  ]),
  Recipe("Potato Pakora", [
    RecipeStep(
        "Slice potatoes thinly and mix with chickpea flour, chopped onions, green chilies, cumin, coriander, and salt.",
        5),
    RecipeStep("Add water gradually to create a thick batter.", 5),
    RecipeStep(
        "Heat oil in a deep frying pan and drop spoonfuls of batter into the hot oil.",
        5),
    RecipeStep(
        "Fry until golden brown and crispy on all sides. Drain on paper towels.",
        10),
  ]),
  Recipe("Root Vegetable Biryani", [
    RecipeStep(
        "In a large pot, sauté chopped root vegetables (carrots, potatoes, and turnips) in oil until slightly tender.",
        10),
    RecipeStep(
        "Add boiling water to the pot, cover, and cook vegetables for 15 minutes until they soften.",
        15),
    RecipeStep(
        "Add curry powder, chaat masala, and salt, cooking for 2 minutes to enhance the flavor.",
        2),
    RecipeStep(
        "Add rice and enough water to cover. Cook until the water is absorbed and rice is tender.",
        20),
    RecipeStep("Garnish with chopped coriander and serve hot.", 5),
  ]),
  Recipe("Chicken Pakora", [
    RecipeStep(
        "In a bowl, mix chicken pieces with chickpea flour, minced garlic, spices (cumin, coriander, turmeric), and a little water to form a batter.",
        5),
    RecipeStep(
        "Heat oil in a deep pan and fry the chicken pieces until they are crispy and golden brown.",
        10),
  ]),
  Recipe("Balti Chicken", [
    RecipeStep(
        "In a large pan, heat oil and add finely chopped onions. Cook until onions are light brown.",
        10),
    RecipeStep(
        "Add diced tomatoes, chicken pieces, garlic, ginger, and a blend of Balti spices. Stir to coat the chicken.",
        15),
    RecipeStep(
        "Cook on medium heat, stirring occasionally until chicken is cooked through and the sauce thickens.",
        20),
  ]),
  Recipe("Mango Sorbet", [
    RecipeStep(
        "Blend ripe mango, sweetener, and yogurt until smooth and creamy.", 5),
    RecipeStep(
        "Pour the mixture into a shallow container and freeze for 2-3 hours, stirring occasionally.",
        180),
    RecipeStep(
        "After partially setting, beat the mixture with a fork to break up ice crystals, then return to the freezer until firm.",
        240),
    RecipeStep("Serve with fresh mango slices as garnish.", 2),
  ]),
  Recipe("Chum Chums", [
    RecipeStep(
        "Prepare paneer by boiling milk and adding lemon juice until curds separate. Drain and shape into balls.",
        15),
    RecipeStep(
        "Press the paneer balls under a heavy object to drain excess water.",
        60),
    RecipeStep(
        "Deep fry paneer balls until golden brown, then soak them in sugar syrup for sweetness.",
        15),
  ]),
  Recipe("Kheer (Rice Pudding)", [
    RecipeStep(
        "Rinse rice and boil it in water until the grains are soft and tender.",
        20),
    RecipeStep("Add sugar and cardamom pods for aroma and flavor.", 5),
    RecipeStep(
        "Pour in milk and bring the mixture to a boil, stirring frequently.",
        10),
    RecipeStep(
        "Simmer on low heat until the mixture thickens and becomes creamy.",
        15),
  ]),
  Recipe("Hotpot", [
    RecipeStep("Preheat oven to 180°C and prepare the ingredients.", 5),
    RecipeStep(
        "Brown lamb pieces in a pan with a little oil until seared on all sides.",
        5),
    RecipeStep(
        "Cook onions with a pinch of salt until soft, then add garlic for extra flavor.",
        3),
    RecipeStep(
        "Stir in flour, stock, thyme, bay leaves, and Worcestershire sauce, letting the flavors meld together.",
        10),
    RecipeStep(
        "Layer browned lamb and vegetables in a casserole dish, topping with potato slices.",
        10),
    RecipeStep(
        "Cook in oven for 40 minutes, or until potatoes are golden and crisp.",
        40),
  ]),
  Recipe("Spaghetti Carbonara", [
    RecipeStep("Boil pasta in salted water until al dente, then drain.", 10),
    RecipeStep("In a pan, cook pancetta until crispy and remove from heat.", 5),
    RecipeStep(
        "In a bowl, whisk together eggs, grated Parmesan, salt, and pepper.",
        5),
    RecipeStep(
        "Combine pasta and pancetta, then quickly stir in egg mixture off heat to create a creamy sauce.",
        5),
  ]),
  Recipe("Caesar Salad", [
    RecipeStep("Tear lettuce leaves and place them in a large bowl.", 3),
    RecipeStep(
        "Whisk together garlic, anchovy paste, mustard, lemon juice, and olive oil to make the dressing.",
        5),
    RecipeStep(
        "Toss lettuce with dressing and top with croutons and grated Parmesan.",
        5),
  ]),
  Recipe("Tom Yum Soup", [
    RecipeStep(
        "Boil water with lemongrass, galangal, and kaffir lime leaves for aroma.",
        10),
    RecipeStep(
        "Add mushrooms, tomatoes, and shrimp, cooking until shrimp is opaque.",
        5),
    RecipeStep(
        "Season with fish sauce, lime juice, and chili paste, adjusting to taste.",
        5),
    RecipeStep("Garnish with fresh cilantro before serving.", 2),
  ]),
  Recipe("Egg Fried Rice", [
    RecipeStep(
        "Heat oil in a pan and scramble eggs lightly, then remove from pan.",
        3),
    RecipeStep(
        "In the same pan, sauté garlic and vegetables (carrots, peas, etc.) until tender.",
        5),
    RecipeStep(
        "Add cooked rice, soy sauce, and scrambled eggs, stirring until well combined.",
        5),
  ]),
  Recipe("Beef Tacos", [
    RecipeStep(
        "Cook ground beef in a skillet with spices (cumin, chili powder, paprika) until browned.",
        10),
    RecipeStep("Warm taco shells in the oven or on a pan.", 5),
    RecipeStep(
        "Fill taco shells with beef, lettuce, cheese, and salsa. Top with sour cream if desired.",
        5),
  ]),
  Recipe("Garlic Bread", [
    RecipeStep("Preheat oven to 180°C.", 5),
    RecipeStep(
        "Mix softened butter with minced garlic, parsley, and a pinch of salt.",
        5),
    RecipeStep(
        "Spread mixture on sliced baguette and bake until golden and crispy.",
        10),
  ]),
  Recipe("Vegetable Stir-Fry", [
    RecipeStep(
        "Heat oil in a wok and add garlic, ginger, and mixed vegetables.", 5),
    RecipeStep(
        "Stir-fry until vegetables are tender-crisp, then add soy sauce and sesame oil.",
        5),
    RecipeStep("Serve hot over steamed rice or noodles.", 2),
  ]),
  Recipe("Pumpkin Soup", [
    RecipeStep(
        "Sauté chopped onions and garlic in a large pot until translucent.", 5),
    RecipeStep(
        "Add pumpkin chunks and vegetable broth, bringing to a boil.", 10),
    RecipeStep(
        "Simmer until pumpkin is soft, then blend until smooth and creamy.",
        15),
    RecipeStep(
        "Season with salt, pepper, and a splash of cream if desired.", 2),
  ]),
  Recipe("Blueberry Muffins", [
    RecipeStep("Preheat oven to 190°C and line a muffin tin.", 5),
    RecipeStep("Mix flour, sugar, baking powder, and salt in a large bowl.", 5),
    RecipeStep(
        "In another bowl, whisk together eggs, milk, and melted butter, then combine with dry ingredients.",
        5),
    RecipeStep(
        "Gently fold in blueberries, then spoon batter into muffin cups.", 5),
    RecipeStep("Bake until golden brown and a toothpick comes out clean.", 20),
  ]),
  Recipe("Lemon Drizzle Cake", [
    RecipeStep("Preheat oven to 180°C and grease a loaf pan.", 5),
    RecipeStep("Cream butter and sugar together until light and fluffy.", 5),
    RecipeStep(
        "Beat in eggs one at a time, then fold in flour and lemon zest.", 5),
    RecipeStep(
        "Pour batter into the pan and bake until a skewer comes out clean.",
        30),
    RecipeStep(
        "While the cake bakes, prepare a lemon glaze with lemon juice and icing sugar.",
        5),
    RecipeStep("Drizzle glaze over the cake while still warm.", 2),
  ]),
  // Add additional recipes to complete up to 50, continuing in a similar detailed manner.
];
