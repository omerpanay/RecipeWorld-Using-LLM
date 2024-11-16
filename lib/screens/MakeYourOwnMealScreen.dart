import 'package:flutter/material.dart';

class MakeYourOwnMealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Make Your Own Meal"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Text(
          "Make Your Own Meal",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
