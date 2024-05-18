import 'package:flutter/material.dart';
import 'RecipeGeneratorScreen.dart';
import 'FavoritesScreen.dart';
import 'RecipeDetailScreen.dart';
import 'LogIn.dart';
import 'MyProfileScreen.dart';
import 'PostRecipeScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/ucheflogo.png',
            height: 50,
          ),
        ),
        actions: [
          PopupMenuButton<int>(
            icon: Icon(Icons.menu),
            onSelected: (item) => _onMenuItemSelected(context, item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: [
                    Image.asset('assets/user.png', height: 24),
                    SizedBox(width: 8),
                    Text("My Profile"),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.home),
                    SizedBox(width: 8),
                    Text("Home"),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 8),
                    Text("Post a Recipe"),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 3,
                child: Row(
                  children: [
                    Icon(Icons.notifications),
                    SizedBox(width: 8),
                    Text("Notification"),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 4,
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(width: 8),
                    Text("Settings"),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 5,
                child: Row(
                  children: [
                    Icon(Icons.bookmark),
                    SizedBox(width: 8),
                    Text("Bookmarked"),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 6,
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 8),
                    Text("Logout"),
                  ],
                ),
              ),
            ],
          ),
        ],
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          _buildSecondaryAppBar(context),
          Expanded(
            child: ListView.builder(
              itemCount: 11, // Add one extra item for the "Your Community" header
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildCommunityHeader();
                } else {
                  return RecipeCard(index - 1);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondaryAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecipeGeneratorScreen()),
              );
            },
            child: Text(
              "What's in your fridge?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Staatliches',
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(2, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
        ],
      ),
      backgroundColor: Colors.redAccent,
      automaticallyImplyLeading: false,
    );
  }

  Widget _buildCommunityHeader() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Check out the dishes from your neighbours!",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: 'Galada',
              fontStyle: FontStyle.normal, // Making the text italic
            ),
          ),
          SizedBox(height: 8.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/header.png',
            ),
          ),
        ],
      ),
    );
  }

  void _onMenuItemSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
      // Navigate to My Profile screen
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfileScreen()));
        break;
      case 1:
      // Navigate to Home screen
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        break;
      case 2:
      // Navigate to Post a Recipe screen
      Navigator.push(context, MaterialPageRoute(builder: (context) => PostRecipeScreen()));
        break;
      case 3:
      // Navigate to Notification screen
      //Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
        break;
      case 4:
      // Navigate to Settings screen
      //Navigator.push(context, MaterialPageRoute(builder : (context) => SettingsScreen()));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritesScreen()));
        break;
      case 6:
        _showLogoutDialog(context);
        break;
    }
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LogIn()),
                      (route) => false,
                );
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}

class RecipeCard extends StatefulWidget {
  final int index;

  RecipeCard(this.index);

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool isFavorite = false;
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeDetailScreen(imagePath: 'assets/recipe.png'),
            ),
          );
        },
        child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    AspectRatio(
    aspectRatio: 1.0,
    child: Stack(
    children: [
      _buildRecipeImage(),
      _buildUserInfo(),
      _buildBookmarkIcon(),
      _buildFollowButton(),
    ],
    ),
    ),
      SizedBox(height: 8.0),
      Text(
        'Recipe Name',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: 'Galada',
          fontSize: 20.0,
          color: Colors.black87,
        ),
      ),
    ],
    ),
        ),
    );
  }

  Widget _buildRecipeImage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        image: DecorationImage(
          image: AssetImage('assets/recipe.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Positioned(
      left: 10.0,
      top: 10.0,
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              'assets/user.png',
              height: 40.0,
              width: 40.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '@Username',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 4),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFollowing = !isFollowing;
                  });
                },
                child: Text(
                  isFollowing ? 'Following' : 'Follow',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: isFollowing ? Colors.black87 : Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBookmarkIcon() {
    return Positioned(
      right: 10.0,
      top: 10.0,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        child: Icon(
          Icons.bookmark,
          color: isFavorite ? Colors.yellow : Colors.white,
          size: 30.0,
        ),
      ),
    );
  }

  Widget _buildFollowButton() {
    return Positioned(
      right: 10.0,
      bottom: 10.0,
      child: GestureDetector(
        onTap: () {
          setState(() {
            isFollowing = !isFollowing;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          decoration: BoxDecoration(
            color: isFollowing ? Colors.grey : Colors.blue,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            isFollowing ? 'Following' : 'Follow',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
