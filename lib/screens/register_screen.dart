import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/yemek3.webp",
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Register',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _authService.registerWithEmailAndPassword(
                        context,
                        emailController.text,
                        passwordController.text,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.orangeAccent,
                    ),
                    child: Text("Register"),
                  ),
                  SizedBox(height: 10),
                  OutlinedButton.icon(
                    icon: Icon(Icons.login),
                    label: Text("Register With Google"),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      foregroundColor: Colors.orangeAccent,
                    ),
                    onPressed: () {
                      _authService.signInWithGoogle(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
