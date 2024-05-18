import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'RecipeDetailScreen.dart';
import 'HomeScreen.dart';

class SampleIngredientsScreen extends StatefulWidget {
  @override
  _SampleIngredientsScreenState createState() => _SampleIngredientsScreenState();
}

class _SampleIngredientsScreenState extends State<SampleIngredientsScreen> {
  List<String> favoriteIngredients = [];

  @override
  void initState() {
    super.initState();
    _loadFavoriteIngredients();
  }

  // Load favorite ingredients from SharedPreferences
  void _loadFavoriteIngredients() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favoriteIngredients = prefs.getStringList('favoriteIngredients') ?? [];
    });
  }

  // Save favorite ingredients to SharedPreferences
  void _saveFavoriteIngredients() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favoriteIngredients', favoriteIngredients);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Here are the Recipes!',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Staatliches'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              _showFavoritesDialog();
            },
          ),
          IconButton( // Add this IconButton for home
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacement( // Use pushReplacement to go to HomeScreen and replace the current screen
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.redAccent, // Set app bar background color
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return _buildIngredientBox(index);
        },
      ),
    );
  }

  Widget _buildIngredientBox(int index) {
    bool isFavorite = favoriteIngredients.contains('Recipe $index');
    return GestureDetector(
      onTap: () {
        _toggleFavorite('Recipe $index');
        // Navigate to RecipeDetailScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailScreen(imagePath: 'assets/recipe.png'),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 4,
        margin: EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/recipe.png', // Path to the image
                  height: 100.0, // Adjust image height
                  width: 100.0, // Adjust image width
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  'Recipe $index',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 18.0), // Set text style
                ),
              ),
              IconButton(
                icon: isFavorite ? Icon(Icons.favorite, color: Colors.red) : Icon(Icons.favorite_border),
                onPressed: () {
                  _toggleFavorite('Recipe $index');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Toggle ingredient favorite status
  void _toggleFavorite(String ingredient) {
    setState(() {
      if (favoriteIngredients.contains(ingredient)) {
        favoriteIngredients.remove(ingredient);
      } else {
        favoriteIngredients.add(ingredient);
      }
      _saveFavoriteIngredients();
    });
  }

  // Show dialog with favorite ingredients
  void _showFavoritesDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Favorite Recipe'),
          content: SingleChildScrollView(
            child: Column(
              children: favoriteIngredients.map((ingredient) {
                return ListTile(
                  title: Text(
                    ingredient,
                    style: TextStyle(color: Colors.black87), // Set text color
                  ),
                  onTap: () {
                    _toggleFavorite(ingredient);
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
