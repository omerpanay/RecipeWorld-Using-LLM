import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // dotenv için gerekli

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase başlatma işlemi
  try {
    await Firebase.initializeApp();
    print("Firebase başarıyla başlatıldı.");
  } catch (e) {
    print("Firebase başlatma hatası: $e");
  }

  // Dotenv yükleme işlemi
  try {
    await dotenv.load(
        fileName:
            "C:\Users\Public\firebase2\.env"); // .env dosyasını yüklüyoruz
    print("Dotenv başarıyla yüklendi: ${dotenv.env['API_KEY']}");
  } catch (e) {
    print("Dotenv yükleme hatası: $e");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
