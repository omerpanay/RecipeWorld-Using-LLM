import 'package:flutter/material.dart';
import 'RecipeDetailScreen.dart';

class RecipeListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> subcategories;
  final String categoryName;

  RecipeListScreen({required this.subcategories, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView.builder(
        itemCount: subcategories.length,
        itemBuilder: (context, index) {
          final subcategory = subcategories[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(subcategory['image']!),
            ),
            title: Text(subcategory['name']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailScreen(
                    recipeName: subcategory['name'],
                    instructions: subcategory['instructions'],
                    imagePath: subcategory['image'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
