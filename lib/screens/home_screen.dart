import 'package:flutter/material.dart';
import 'package:firebase2/screens/RecipeScreen.dart';
import 'package:firebase2/screens/ReadyRecipesScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Arka plan resmi (opacity ile soluklaştırıldı)
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/recipe_app_banner3.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          // İçerik
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              // Başlık
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Welcome to Recipe World",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                    shadows: [
                      Shadow(
                        offset: Offset(3, 3),
                        blurRadius: 6,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Açıklama
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Discover delicious recipes or create your own masterpieces!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 4,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              // Butonlar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecipeScreen(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.orange, Colors.deepOrange],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(2, 4),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 18),
                          child: Center(
                            child: Text(
                              "Make Your Own Meal",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReadyRecipesScreen(),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.orangeAccent, Colors.amber],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(2, 4),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 18),
                          child: Center(
                            child: Text(
                              "Ready Recipes",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
