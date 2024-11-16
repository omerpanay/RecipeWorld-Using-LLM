import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Email ve Şifre ile Giriş Yapma
  Future<void> signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      showAlertDialog(context, "Giriş yapılamadı: ${e.toString()}");
    }
  }

  // Google ile Giriş Yapma
  // Google ile Giriş Yapma
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await _auth.signInWithCredential(credential);
        Navigator.pushReplacementNamed(
            context, '/home'); // Başarılıysa ana ekrana yönlendir
      } else {
        showAlertDialog(context, "Google ile giriş iptal edildi.");
      }
    } catch (e) {
      showAlertDialog(context, "Google ile giriş yapılamadı: ${e.toString()}");
    }
  }

  // Email ve Şifre ile Kayıt Olma
  Future<void> registerWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      showAlertDialog(context, "Kayıt yapılamadı: ${e.toString()}");
    }
  }

  // Hata mesajları için AlertDialog
  // AlertDialog için yardımcı fonksiyon
  void showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Hata"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Tamam"),
            ),
          ],
        );
      },
    );
  }
}
