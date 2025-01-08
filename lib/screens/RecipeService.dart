import 'dart:convert';
import 'package:http/http.dart' as http;

class RecipeService {
  final String _apiKey =
      "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"; // .env dosyasına taşımanız önerilir

  Future<String> generateRecipe(String ingredients) async {
    const String apiUrl = "https://api.openai.com/v1/chat/completions";

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          "model": "gpt-4",
          "messages": [
            {
              "role": "system",
              "content":
                  "You are a helpful assistant that generates recipes with only given ingredients."
            },
            {
              "role": "user",
              "content":
                  "Create a recipe using these ingredients : $ingredients"
            }
          ],
          "max_tokens": 250,
          "temperature": 0.7,
          "top_p": 1.0,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'] ?? "No recipe found.";
      } else {
        return "Error: ${response.body}";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}
