import 'package:firebase2/screens/MakeYourOwnMealScreen.dart';
import 'package:firebase2/screens/ReadyRecipesScreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {"name": "Soup", "image": "assets/images/corba.jpeg"},
    {"name": "Meat", "image": "assets/images/et.jpeg"},
    {"name": "Sweet", "image": "assets/images/tatli.jpg"},
    {"name": "Pastry", "image": "assets/images/hamur.jpg"},
    {"name": "Diet", "image": "assets/images/diyet.jpg"},
    {"name": "Fish", "image": "assets/images/balik.webp"},
    {"name": "Ice Cream", "image": "assets/images/dondurma.jpeg"},
    {"name": "raw meatballs", "image": "assets/images/cigkofte.jpeg"},
    {"name": "Chicken", "image": "assets/images/tavuk.webp"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Freshly tried recipes every day",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Her satırda 3 kategori göster
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            categories[index]["image"]!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        categories[index]["name"]!,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MakeYourOwnMealScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8), // Buton boyutlarını küçülttük
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15), // Kenarları yumuşattık
                    ),
                  ),
                  child: Text(
                    "Make Your Own Meal",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReadyRecipesScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8), // Buton boyutlarını küçülttük
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15), // Kenarları yumuşattık
                    ),
                  ),
                  child: Text(
                    "Ready Recipes",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
