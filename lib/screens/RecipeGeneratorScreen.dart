import 'package:flutter/material.dart';
import 'SampleIngredientsScreen.dart';
import 'HomeScreen.dart';

class RecipeGeneratorScreen extends StatefulWidget {
  const RecipeGeneratorScreen({Key? key}) : super(key: key);

  @override
  _RecipeGeneratorScreenState createState() => _RecipeGeneratorScreenState();
}

class _RecipeGeneratorScreenState extends State<RecipeGeneratorScreen> {
  List<Widget> ingredientFields = [
    _buildIngredientTextField(1), // Initial ingredient text field
  ];

  bool _isLoading = false;
  String _loadingText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipe Generator',
          style: TextStyle(
            fontFamily: 'Staatliches',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.redAccent, // Set app bar background color
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            icon: Icon(Icons.home), // Home icon
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter Ingredients',
              style: TextStyle(
                fontSize: 24.0,
                fontFamily: 'Galada',
                fontWeight: FontWeight.bold,
                color: Colors.black87, // Set text color
              ),
            ),
            SizedBox(height: 20.0),
            Column(
              children: ingredientFields,
            ),
            SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: _addIngredientField,
              icon: Icon(Icons.add),
              label: Text(
                'Add Ingredient',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 14.0),
              ),
            ),
            SizedBox(height: 20.0),
            _isLoading
                ? Center(
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text(
                    _loadingText,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            )
                : ElevatedButton.icon(
              onPressed: _generateRecipe,
              icon: Icon(Icons.fastfood), // Use a suitable icon for generating recipes
              label: Text(
                'Generate Recipe',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 14.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to add a new ingredient text field
  void _addIngredientField() {
    setState(() {
      ingredientFields.add(_buildIngredientTextField(ingredientFields.length + 1));
    });
  }

  // Function to build an ingredient text field with index
  static Widget _buildIngredientTextField(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Ingredient $index',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  // Function to generate recipe
  void _generateRecipe() {
    // Show loading text
    setState(() {
      _isLoading = true;
      _loadingText = "Checking for recipes...";
    });

    // Simulate a loading delay
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SampleIngredientsScreen()),
        );
      });
    });
  }
}
