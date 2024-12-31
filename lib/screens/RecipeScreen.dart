import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:google_fonts/google_fonts.dart';
import 'RecipeService.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Generator',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: RecipeScreen(),
    );
  }
}

class RecipeScreen extends StatefulWidget {
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  final TextEditingController _ingredientController = TextEditingController();
  final List<String> _ingredients = [];
  String _recipe = '';
  late stt.SpeechToText _speechToText;
  bool _isListening = false;
  final RecipeService _recipeService = RecipeService();

  @override
  void initState() {
    super.initState();
    _speechToText = stt.SpeechToText();
  }

  Future<void> _startListening() async {
    bool available = await _speechToText.initialize(
      onStatus: (status) => print('Speech Status: $status'),
      onError: (error) => print('Speech Error: $error'),
    );

    if (available) {
      setState(() {
        _isListening = true;
      });

      await _speechToText.listen(
        onResult: (result) {
          setState(() {
            _ingredientController.text = result.recognizedWords;
          });
        },
        localeId: "en_US",
      );
    }
  }

  void _stopListening() {
    setState(() {
      _isListening = false;
    });
    _speechToText.stop();
  }

  void _addIngredient() {
    if (_ingredientController.text.isNotEmpty) {
      setState(() {
        _ingredients.add(_ingredientController.text);
        _ingredientController.clear();
      });
    }
  }

  Future<void> _generateRecipe() async {
    if (_ingredients.isEmpty) {
      setState(() {
        _recipe = "Please add at least one ingredient!";
      });
      return;
    }

    setState(() {
      _recipe = "Generating recipe...";
    });

    try {
      final ingredientsString = _ingredients.join(', ');
      final generatedRecipe =
          await _recipeService.generateRecipe(ingredientsString);

      setState(() {
        _recipe = generatedRecipe;
      });
    } catch (e) {
      setState(() {
        _recipe = "Error generating recipe: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recipe Generator',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Profesyonel TextField
          TextField(
            controller: _ingredientController,
            decoration: InputDecoration(
              labelText: 'Enter an ingredient',
              labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
              filled: true,
              fillColor: Colors.orange[50],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.orange, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.deepOrange, width: 2),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.mic,
                  color: _isListening ? Colors.red : Colors.grey,
                ),
                onPressed: _isListening ? _stopListening : _startListening,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add Ingredient'),
            onPressed: _addIngredient,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Ingredients:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Wrap(
            spacing: 8.0,
            children: _ingredients.map((ingredient) {
              return Chip(
                label: Text(ingredient),
                backgroundColor: Colors.orange[100],
                deleteIcon: Icon(Icons.close, color: Colors.red),
                onDeleted: () {
                  setState(() {
                    _ingredients.remove(ingredient);
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: _generateRecipe,
              child: Text('Generate Recipe'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _recipe.isNotEmpty
              ? Text(
                  _recipe,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                )
              : Container(),
        ],
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.orange,
        children: [
          SpeedDialChild(
            child: Icon(Icons.help),
            label: 'Help',
            onTap: () => print('Help clicked'),
          ),
          SpeedDialChild(
            child: Icon(Icons.settings),
            label: 'Settings',
            onTap: () => print('Settings clicked'),
          ),
        ],
      ),
    );
  }
}
