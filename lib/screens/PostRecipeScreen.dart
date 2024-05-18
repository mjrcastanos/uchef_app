import 'package:flutter/material.dart';
import 'HomeScreen.dart'; // Import HomeScreen.dart

class PostRecipeScreen extends StatefulWidget {
  @override
  _PostRecipeScreenState createState() => _PostRecipeScreenState();
}

class _PostRecipeScreenState extends State<PostRecipeScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _instructionsController = TextEditingController();
  List<Widget> ingredientFields = [_buildIngredientTextField(1)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post a Recipe',
          style: TextStyle(
            fontFamily: 'Staatliches',
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Implement photo upload functionality
              },
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                  image: DecorationImage(
                    image: AssetImage('assets/upload_placeholder.jpg'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.camera_alt,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildSectionTitle('Recipe Title'),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Enter recipe title',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            SizedBox(height: 20),
            _buildSectionTitle('Ingredients'),
            Column(
              children: ingredientFields,
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _addIngredientField,
                icon: Icon(Icons.add),
                label: Text('Add Ingredient'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildSectionTitle('Instructions'),
            TextField(
              controller: _instructionsController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter instructions',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [Colors.redAccent, Colors.orangeAccent],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    _showUploadConfirmation(context);
                  },
                  child: Text(
                    'Post',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontFamily: 'Galada',
        fontWeight: FontWeight.bold,
      ),
    );
  }

  void _addIngredientField() {
    setState(() {
      ingredientFields.add(_buildIngredientTextField(ingredientFields.length + 1));
    });
  }

  static Widget _buildIngredientTextField(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Ingredient $index',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: Colors.grey[100],
        ),
      ),
    );
  }

  void _showUploadConfirmation(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Your recipe is uploaded!'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
