import 'package:flutter/material.dart';
import 'HomeScreen.dart'; // Import HomeScreen.dart

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false; // Toggle for password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Logo Image
            Center(
              child: Image.asset(
                'assets/ucheflogo.png',
                height: 250, // Adjust the height as needed
                width: 250, // Adjust the width as needed
              ),
            ),
            SizedBox(height: 32.0),
            // Username TextField
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Password TextField
            TextField(
              controller: _passwordController,
              obscureText: !_passwordVisible, // Toggle visibility
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Forgot password link
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigate to the Forgot Password screen
                },
                child: Text('Forgot password?'),
              ),
            ),
            SizedBox(height: 16.0),
            // Log In Button
            ElevatedButton(
              onPressed: () {
                _login();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Text('Log In'),
            ),
            SizedBox(height: 16.0),
            // Create an account link
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  // Navigate to the Create Account screen
                },
                child: Text('Create an account'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() {
    // Check if the username and password are correct (you can replace this with your authentication logic)
    if (_usernameController.text == 'user' && _passwordController.text == '1234') {
      // Navigate to the HomeScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      // Show an error message if the username or password is incorrect
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Incorrect username or password. Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
