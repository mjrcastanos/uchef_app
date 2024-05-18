import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<String> favoriteRecipes = [];

  @override
  void initState() {
    super.initState();
    _loadFavoriteRecipes();
  }

  // Load favorite recipes from SharedPreferences
  void _loadFavoriteRecipes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favoriteRecipes = prefs.getStringList('favoriteRecipes') ?? [];
    });
  }

  // Remove a favorite recipe
  void _removeFavoriteRecipe(String recipe) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favoriteRecipes.remove(recipe);
      prefs.setStringList('favoriteRecipes', favoriteRecipes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bookmarked',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: favoriteRecipes.isEmpty
          ? Center(
        child: Text(
          'No bookmarked recipes yet.',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black54,
          ),
        ),
      )
          : ListView.builder(
        itemCount: favoriteRecipes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              title: Text(
                favoriteRecipes[index],
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.redAccent),
                onPressed: () {
                  _removeFavoriteRecipe(favoriteRecipes[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
