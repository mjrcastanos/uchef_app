import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  final String imagePath;

  RecipeDetailScreen({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipe Details',
          style: TextStyle(
            fontFamily: 'Staatliches',
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Recipe Title',
                style: TextStyle(
                  fontSize: 28.0,
                  fontFamily: 'Galada',
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            _buildSectionTitle('Ingredients:'),
            SizedBox(height: 10.0),
            _buildIngredientText('Ingredient 1'),
            _buildIngredientText('Ingredient 2'),
            // Add more ingredients as needed
            SizedBox(height: 20.0),
            _buildSectionTitle('Instructions:'),
            SizedBox(height: 10.0),
            _buildInstructionStep('Step 1: Lorem ipsum dolor sit'),
            _buildInstructionStep('Step 2: Lorem ipsum dolor sit'),
            _buildInstructionStep('Step 3: Lorem ipsum dolor sit'),
            _buildInstructionStep('Step 4: Lorem ipsum dolor sit'),
            // Add more steps as needed
            SizedBox(height: 20.0),
            _buildSectionTitle('Rate this recipe:'),
            SizedBox(height: 10.0),
            _buildRatingBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: Colors.redAccent,
        ),
      ),
    );
  }

  Widget _buildIngredientText(String ingredient) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        ingredient,
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _buildInstructionStep(String step) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        step,
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _buildRatingBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
            (index) => IconButton(
          icon: Icon(
            index < 3 ? Icons.star_border : Icons.star,
            color: index < 3 ? Colors.grey : Colors.amber,
          ),
          onPressed: () {
            // Handle rating update
          },
        ),
      ),
    );
  }
}
