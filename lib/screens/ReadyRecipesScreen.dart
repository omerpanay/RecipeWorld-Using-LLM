import 'package:flutter/material.dart';
import 'RecipeDetailScreen.dart';

class ReadyRecipesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> recipes = [
    {
      "name": "Soup",
      "image": "assets/images/corba.jpeg",
      "instructions": [
        "Boil water in a pot.",
        "Add chopped vegetables and let it simmer.",
        "Add spices and serve hot."
      ],
    },
    {
      "name": "Meat",
      "image": "assets/images/et.jpeg",
      "instructions": [
        "Season the meat with salt and spices.",
        "Cook on a grill or in a pan until done.",
        "Serve with vegetables or rice."
      ],
    },
    {
      "name": "Sweet",
      "image": "assets/images/tatli.jpg",
      "instructions": [
        "Mix sugar and water to make syrup.",
        "Prepare the dessert base (like dough or semolina).",
        "Pour syrup over the base and serve."
      ],
    },
    {
      "name": "Pastry",
      "image": "assets/images/hamur.jpg",
      "instructions": [
        "Prepare the dough by mixing flour, yeast, and water.",
        "Fill the dough with desired ingredients (like cheese or meat).",
        "Bake in the oven until golden brown."
      ],
    },
    {
      "name": "Diet",
      "image": "assets/images/diyet.jpg",
      "instructions": [
        "Choose fresh vegetables.",
        "Steam or lightly cook them.",
        "Add a sprinkle of olive oil and lemon juice."
      ],
    },
    {
      "name": "Fish",
      "image": "assets/images/balik.webp",
      "instructions": [
        "Season the fish with salt and pepper.",
        "Grill or fry the fish until done.",
        "Serve with lemon wedges."
      ],
    },
    {
      "name": "Ice Cream",
      "image": "assets/images/dondurma.jpeg",
      "instructions": [
        "Mix milk, sugar, and cream.",
        "Churn the mixture in an ice cream maker.",
        "Freeze for 4-6 hours before serving."
      ],
    },
    {
      "name": "Raw Meatballs",
      "image": "assets/images/cigkofte.jpeg",
      "instructions": [
        "Mix bulgur, tomato paste, and spices.",
        "Knead the mixture until it becomes soft.",
        "Shape into small balls and serve with lettuce."
      ],
    },
    {
      "name": "Chicken",
      "image": "assets/images/tavuk.webp",
      "instructions": [
        "Marinate the chicken with yogurt and spices.",
        "Grill or bake in the oven until golden.",
        "Serve with rice or salad."
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ready Recipes"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Bir satırda 2 öğe
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 0.9,
          ),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailScreen(
                      recipeName: recipe['name'],
                      instructions: recipe['instructions'],
                      imagePath: recipe['image'],
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(recipe['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    recipe['name']!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
