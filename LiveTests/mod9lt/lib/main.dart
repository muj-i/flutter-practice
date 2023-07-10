import 'dart:convert';
import 'package:flutter/material.dart';
import 'recipe.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: RecipeListPage(),
    );
  }
}

class RecipeListPage extends StatefulWidget {
  @override
  _RecipeListPageState createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  List<Recipe> recipes = [];

  @override
  void initState() {
    super.initState();
    loadRecipes();
  }

  Future<void> loadRecipes() async {
    String jsonText = '''
      {
        "recipes": [
          {
            "title": "Pasta Carbonara",
            "description": "Creamy pasta dish with bacon and cheese.",
            "ingredients": ["spaghetti", "bacon", "egg", "cheese"]
          },
          {
            "title": "Caprese Salad",
            "description": "Simple and refreshing salad with tomatoes, mozzarella, and basil.",
            "ingredients": ["tomatoes", "mozzarella", "basil"]
          },
          {
            "title": "Banana Smoothie",
            "description": "Healthy and creamy smoothie with bananas and milk.",
            "ingredients": ["bananas", "milk"]
          },
          {
            "title": "Chicken Stir-Fry",
            "description": "Quick and flavorful stir-fried chicken with vegetables.",
            "ingredients": ["chicken breast", "broccoli", "carrot", "soy sauce"]
          },
          {
            "title": "Grilled Salmon",
            "description": "Delicious grilled salmon with lemon and herbs.",
            "ingredients": ["salmon fillet", "lemon", "olive oil", "dill"]
          },
          {
            "title": "Vegetable Curry",
            "description": "Spicy and aromatic vegetable curry.",
            "ingredients": ["mixed vegetables", "coconut milk", "curry powder"]
          },
          {
            "title": "Berry Parfait",
            "description": "Layered dessert with fresh berries and yogurt.",
            "ingredients": ["berries", "yogurt", "granola"]
          }
        ]
      }
    ''';

    Map<String, dynamic> json = jsonDecode(jsonText);

    List<dynamic> recipeList = json['recipes'];

    setState(() {
      recipes = recipeList.map((item) => Recipe.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Recipe'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            leading: Icon(Icons.food_bank),
            title: Text(recipes[index].title),
            subtitle: Text(recipes[index].description),
          );
        },
      ),
    );
  }
}

