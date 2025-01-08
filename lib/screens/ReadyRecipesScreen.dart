import 'package:firebase2/screens/recipe_list_screen.dart';
import 'package:flutter/material.dart';
import 'RecipeDetailScreen.dart';

class ReadyRecipesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> recipes = [
    {
      "name": "Soup",
      "image": "assets/images/corba.jpeg",
      "subcategories": [
        {
          "name": "Lentil Soup",
          "image": "assets/images/lentil_soup.jpg",
          "instructions": [
            "Rinse the lentils thoroughly under cold water to remove any dirt or debris.",
            "Soak lentils in warm water for 30 minutes to soften them.",
            "In a pot, sauté chopped onions, carrots, and garlic in olive oil until tender.",
            "Add lentils, vegetable stock, and a pinch of cumin, then bring to a boil.",
            "Simmer on low heat for 25-30 minutes until the lentils are soft.",
            "Blend the soup until smooth using an immersion blender, then season with salt, pepper, and a squeeze of lemon juice before serving."
          ],
        },
        {
          "name": "Tomato Soup",
          "image": "assets/images/tomato_soup.jpg",
          "instructions": [
            "In a pot, heat olive oil and sauté diced onions and minced garlic until fragrant.",
            "Add 6-8 peeled and chopped fresh tomatoes, a tablespoon of tomato paste, and a teaspoon of sugar.",
            "Cook on medium heat for 10-12 minutes, stirring occasionally.",
            "Add vegetable broth and a handful of fresh basil leaves, then simmer for another 15 minutes.",
            "Blend until smooth and creamy, then garnish with croutons or a drizzle of cream."
          ],
        },
        {
          "name": "Chicken Soup",
          "image": "assets/images/chicken_soup.jpg",
          "instructions": [
            "Boil a whole chicken or chicken thighs in a large pot with water, onion, celery, and carrots.",
            "Remove the chicken once cooked and shred the meat into small pieces.",
            "Add uncooked rice or noodles to the broth and simmer until tender.",
            "Return the shredded chicken to the pot, season with salt, pepper, and a pinch of thyme, then serve hot."
          ],
        },
      ],
    },
    {
      "name": "Meat",
      "image": "assets/images/et.jpeg",
      "subcategories": [
        {
          "name": "Grilled Steak",
          "image": "assets/images/grilled_steak.jpg",
          "instructions": [
            "Take the steak out of the fridge 30 minutes before cooking to bring it to room temperature.",
            "Rub the steak with olive oil, salt, black pepper, and a pinch of garlic powder.",
            "Heat a grill or cast-iron skillet to high heat, then cook the steak for 3-5 minutes per side for medium-rare.",
            "Let the steak rest for 5-10 minutes under foil before slicing and serving."
          ],
        },
        {
          "name": "Beef Stew",
          "image": "assets/images/beef_stew.jpg",
          "instructions": [
            "Cut beef into bite-sized cubes and season with salt and pepper.",
            "Brown the beef in a large pot with a bit of oil, then remove and set aside.",
            "In the same pot, sauté onions, carrots, and celery until softened.",
            "Add the beef back, along with beef broth, red wine, bay leaves, and thyme.",
            "Simmer on low heat for 2-3 hours until the beef is tender. Serve with mashed potatoes or crusty bread."
          ],
        },
        {
          "name": "Meatballs",
          "image": "assets/images/meatball.jpg",
          "instructions": [
            "Combine ground beef with finely chopped onions, garlic, breadcrumbs, egg, parsley, salt, and pepper.",
            "Mix well and shape into small, even-sized balls.",
            "Fry the meatballs in a pan with a little olive oil until browned on all sides.",
            "Simmer the meatballs in marinara sauce for 20 minutes, then serve over spaghetti or as a sub sandwich."
          ],
        },
      ],
    },
    {
      "name": "Sweet",
      "image": "assets/images/tatli.jpg",
      "subcategories": [
        {
          "name": "Baklava",
          "image": "assets/images/baklava.jpg",
          "instructions": [
            "Brush a baking tray with melted butter and layer sheets of phyllo dough, brushing each layer with butter.",
            "Sprinkle finely chopped nuts (pistachios or walnuts) every few layers.",
            "Repeat until all dough is used, then cut into diamond shapes.",
            "Bake at 180°C for 40-45 minutes until golden.",
            "Pour hot sugar syrup flavored with lemon juice over the baked baklava and let it soak for several hours before serving."
          ],
        },
        {
          "name": "Rice Pudding",
          "image": "assets/images/rice_pudding.jpg",
          "instructions": [
            "Cook 1 cup of rice in water until tender, then drain any excess water.",
            "In a pot, combine cooked rice with 4 cups of milk, 1 cup of sugar, and a pinch of salt.",
            "Simmer on low heat, stirring frequently, until thickened (about 20 minutes).",
            "Pour into bowls, let cool, and sprinkle with cinnamon before serving."
          ],
        },
        {
          "name": "Brownies",
          "image": "assets/images/brownies.jpg",
          "instructions": [
            "Melt butter and dark chocolate in a heatproof bowl over simmering water.",
            "Mix in sugar, eggs, and vanilla extract, then fold in flour and cocoa powder.",
            "Pour the batter into a greased baking pan and bake at 180°C for 25-30 minutes.",
            "Let cool completely before cutting into squares for the perfect fudgy texture."
          ],
        },
      ],
    },
    {
      "name": "Pastry",
      "image": "assets/images/hamur.jpg",
      "subcategories": [
        {
          "name": "Cheese Pastry",
          "image": "assets/images/cheese_pastry.jpg",
          "instructions": [
            "In a large bowl, combine 4 cups of flour, 1 packet of instant yeast, 1 teaspoon of salt, and 2 teaspoons of sugar.",
            "Gradually add 1.5 cups of lukewarm water and 2 tablespoons of olive oil while kneading the dough until it becomes smooth and elastic.",
            "Cover the dough with a damp cloth and let it rise in a warm place for 1 hour.",
            "Prepare the filling by mixing 200g of grated cheese with finely chopped parsley.",
            "Roll out small portions of dough into circles, place a spoonful of the filling in the center, and fold the edges to seal.",
            "Place pastries on a baking sheet, brush with egg yolk, and sprinkle sesame seeds on top. Bake at 200°C for 20-25 minutes until golden brown."
          ],
        },
        {
          "name": "Spinach Pastry",
          "image": "assets/images/spinach_pastry.jpeg",
          "instructions": [
            "Wash and chop 500g of fresh spinach leaves. Sauté them with 1 finely chopped onion in 2 tablespoons of olive oil until softened.",
            "Season the spinach with salt, black pepper, and a pinch of nutmeg, then let it cool.",
            "In a separate bowl, prepare the dough by mixing 3 cups of flour, 1 cup of yogurt, 1 teaspoon of baking powder, and 3 tablespoons of melted butter.",
            "Divide the dough into small balls and roll each ball into a thin circle.",
            "Place a spoonful of the spinach mixture in the center of each circle, fold into a crescent shape, and seal the edges.",
            "Bake at 190°C for 25-30 minutes until the pastries are golden and crispy."
          ],
        },
      ],
    },
    {
      "name": "Diet",
      "image": "assets/images/diyet.jpg",
      "subcategories": [
        {
          "name": "Steamed Vegetables",
          "image": "assets/images/steamed_vegetables.jpg",
          "instructions": [
            "Choose fresh vegetables like broccoli, carrots, and cauliflower. Wash and cut them into bite-sized pieces.",
            "Place the vegetables in a steamer basket over boiling water. Cover and steam for 10-12 minutes until tender.",
            "Season with a sprinkle of olive oil, lemon juice, salt, and black pepper before serving."
          ],
        },
        {
          "name": "Quinoa Salad",
          "image": "assets/images/quinoa_salad.jpg",
          "instructions": [
            "Rinse 1 cup of quinoa under cold water and cook it in 2 cups of boiling water for 15 minutes. Let it cool.",
            "Chop fresh vegetables like cucumbers, cherry tomatoes, and bell peppers into small pieces.",
            "Mix the quinoa with the vegetables, add a handful of chopped parsley, and drizzle with olive oil and lemon juice.",
            "Season with salt, pepper, and a pinch of paprika. Serve as a healthy side dish or light main course."
          ],
        },
      ],
    },
    {
      "name": "Fish",
      "image": "assets/images/balik.webp",
      "subcategories": [
        {
          "name": "Grilled Salmon",
          "image": "assets/images/grilled_salmon.jpg",
          "instructions": [
            "Marinate 2 salmon fillets with olive oil, lemon juice, garlic, salt, and pepper for 20 minutes.",
            "Preheat a grill or grill pan and cook the salmon for 4-5 minutes on each side until the fish flakes easily with a fork.",
            "Serve with a side of grilled vegetables or a fresh green salad."
          ],
        },
        {
          "name": "Baked Sea Bass",
          "image": "assets/images/baked_see_bas.jpg",
          "instructions": [
            "Preheat the oven to 180°C. Clean and gut a whole sea bass, then score the skin lightly.",
            "Stuff the cavity with slices of lemon, garlic cloves, and fresh herbs like parsley or dill.",
            "Drizzle the fish with olive oil, season with salt and pepper, and bake on a lined tray for 25-30 minutes."
          ],
        },
      ],
    },
    {
      "name": "Ice Cream",
      "image": "assets/images/dondurma.jpeg",
      "subcategories": [
        {
          "name": "Vanilla Ice Cream",
          "image": "assets/images/vanilla_icecream.jpg",
          "instructions": [
            "In a medium saucepan, heat 2 cups of milk, 1 cup of heavy cream, and 1 cup of sugar until the sugar dissolves. Do not boil.",
            "Whisk 4 egg yolks in a separate bowl, then slowly add the hot milk mixture while whisking continuously.",
            "Return the mixture to the saucepan and cook over low heat until it thickens slightly.",
            "Stir in 1 teaspoon of vanilla extract, let it cool, and churn in an ice cream maker before freezing for 4-6 hours."
          ],
        },
        {
          "name": "Chocolate Ice Cream",
          "image": "assets/images/chocolate_ice.jpeg",
          "instructions": [
            "Mix 2 cups of milk, 1 cup of heavy cream, 1/2 cup of cocoa powder, and 3/4 cup of sugar in a saucepan.",
            "Heat the mixture until the sugar dissolves, then let it cool to room temperature.",
            "Churn the mixture in an ice cream maker and freeze for 4-6 hours for a rich, creamy dessert."
          ],
        },
      ],
    },
    {
      "name": "Raw Meatballs",
      "image": "assets/images/cigkofte.jpeg",
      "subcategories": [
        {
          "name": "Traditional Çiğ Köfte",
          "image": "assets/images/traditional.jpg",
          "instructions": [
            "Soak 2 cups of fine bulgur in warm water for 10 minutes until it softens.",
            "Add 2 tablespoons of tomato paste, 1 tablespoon of red pepper paste, and spices like cumin, paprika, and black pepper.",
            "Knead the mixture with your hands until it becomes smooth, adding olive oil if needed.",
            "Shape into small patties and serve with fresh lettuce leaves and lemon wedges."
          ],
        },
        {
          "name": "Walnut Çiğ Köfte",
          "image": "assets/images/walnut.jpg",
          "instructions": [
            "Prepare 2 cups of fine bulgur as described for traditional çiğ köfte.",
            "Add crushed walnuts to the bulgur mixture for added crunch and flavor.",
            "Knead the mixture with spices and olive oil, then shape into small patties.",
            "Serve with pomegranate molasses and fresh herbs for a unique twist."
          ],
        },
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
            crossAxisCount: 2, // Her satırda 2 öğe olacak
            crossAxisSpacing: 12.0, // Izgara öğeleri arasındaki yatay boşluk
            mainAxisSpacing: 12.0, // Izgara öğeleri arasındaki dikey boşluk
            childAspectRatio: 0.9, // Öğelerin yüksekliği ve genişliği oranı
          ),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeListScreen(
                      subcategories: recipe["subcategories"],
                      categoryName: recipe["name"],
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
                          image: AssetImage(recipe["image"]!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    recipe["name"]!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
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
