import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iit_chat/screens/login_screen.dart';
import 'package:iit_chat/screens/splash_screen.dart';

class AuthenticationProvider {
  //FirebaseAuth instance
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //Determine if the user is authenticated.
  handleAuth() {
    return StreamBuilder(
      stream: firebaseAuth.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return const SplashScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }

  //Constuctor to initalize the FirebaseAuth instance

  //Using Stream to listen to Authentication State
  Stream<User?> get authState => firebaseAuth.idTokenChanges();

  //............RUDIMENTARY METHODS FOR AUTHENTICATION................

  //SIGN UP METHOD
  Future<UserCredential?> signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential user = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return user;
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.message!),
        backgroundColor: Colors.red,
      ));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
        backgroundColor: Colors.red,
      ));
    }
    return null;
  }

  //SIGN IN METHOD
  Future<UserCredential?> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential user = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return user;
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.message!),
        backgroundColor: Colors.red,
      ));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
        backgroundColor: Colors.red,
      ));
    }
    return null;
  }

  //SIGN OUT METHOD
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

// Reset Password Lik
  Future<void> resetPasswordLink(context, {required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.message!),
        backgroundColor: Colors.red,
      ));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }
}
