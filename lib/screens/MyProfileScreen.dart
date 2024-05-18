import 'package:flutter/material.dart';
import 'PostRecipeScreen.dart';
import 'HomeScreen.dart';
import 'RecipeDetailScreen.dart';

class MyProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Colors.white, fontFamily: 'Staatliches',// Set text color to white
          ),
        ),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.home), // Add home icon
            onPressed: () {
              Navigator.pushReplacement( // Navigate to HomeScreen using pushReplacement to replace current screen
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/user.png'),
            ),
            SizedBox(height: 16),
            Text(
              'Michael Jun Robert',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black, fontFamily: 'Galada'),
            ),
            SizedBox(height: 8),
            Text(
              '@imaikuljeon',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            _buildProfileInfoItem(Icons.info, 'Bio', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
            SizedBox(height: 8), // Reduce space below the bio text
            Divider(
              color: Colors.grey[400],
              thickness: 1.0,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildProfileInfoItem(Icons.calendar_today, 'Joined', 'August 2022'),
                _buildProfileInfoItem(Icons.people, 'Followers', '28'),
                _buildProfileInfoItem(Icons.people_outline, 'Following', '69'),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Your posted recipes', // Section title
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Set scroll direction to horizontal
                itemCount: 5, // Assuming you want to display 5 recipe images
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeDetailScreen(imagePath: 'assets/recipe.png'), // Navigate to RecipeDetailScreen
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/recipe.png',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover, // Adjust image fit to cover
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            // Add the button at the bottom
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 12.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the PostRecipeScreen when the button is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostRecipeScreen()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 14.0),
                  ),
                ),
                child: Text(
                  'Share a recipe of yours!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfoItem(IconData icon, String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.grey[600],
        ),
        SizedBox(height: 6),
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 2),
        Text(
          value,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
