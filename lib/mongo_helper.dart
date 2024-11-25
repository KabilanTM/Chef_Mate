import 'package:mongo_dart/mongo_dart.dart';
import 'recipe.dart'; // The Recipe and Ingredient model

class MongoHelper {
  static late Db db;  // MongoDB database instance
  static late DbCollection recipeCollection;  // Collection for recipes

  // Connect to the MongoDB database
  static Future<void> connect() async {
    const String uri = 'mongodb+srv://maintainer_philix:qwertyuiop@carbonpi.hiozz58.mongodb.net/chefmate?retryWrites=true&w=majority';  // Replace with your MongoDB connection string
    db = await Db.create(uri);
    await db.open();
    recipeCollection = db.collection('recipes'); 
  }

  // Fetch all recipes
  static Future<List<Recipe>> fetchRecipes() async {
    try {
      await connect();
      var recipesJson = await recipeCollection.find().toList();
      return recipesJson.map((json) => Recipe.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch recipes: $e');
    }
  }

  // Close the connection
  static Future<void> close() async {
    await db.close();
  }
}
