import 'package:flutter/material.dart';

class ReadyRecipesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ready Recipes"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Text(
          "See Popular Recipes!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
