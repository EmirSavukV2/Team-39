import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

/// AuthServices class singleton class
class AuthServices {
  static final AuthServices instance = AuthServices._internal();
  factory AuthServices() {
    return instance;
  }
  AuthServices._internal();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? getCurrentUser() {
    if (_auth.currentUser != null) {
      return _auth.currentUser;
    } else {
      Get.offAllNamed("/welcome");
      return null;
    }
  }

  void checkUserLogin() {
    User? user = _auth.currentUser;
    if (user != null) {
      Get.back();
      Get.toNamed('/home');
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        await firebaseUser.updateDisplayName(displayName);
        Get.back();
        Get.offAllNamed('/home');
      } else {
        Fluttertoast.showToast(
            msg: 'Failed to Login : Firebase User return null',
            toastLength: Toast.LENGTH_LONG);
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.message.toString(), toastLength: Toast.LENGTH_LONG);
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString(), toastLength: Toast.LENGTH_LONG);
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        Get.back();
        Get.offAllNamed('/home');
      } else {
        Fluttertoast.showToast(
            msg: 'Failed to Login : Firebase User return null',
            toastLength: Toast.LENGTH_LONG);
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.message.toString(), toastLength: Toast.LENGTH_LONG);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), toastLength: Toast.LENGTH_LONG);
    }
  }

  // SignOut
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Get.offAllNamed('/welcome');
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.message.toString(), toastLength: Toast.LENGTH_LONG);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), toastLength: Toast.LENGTH_LONG);
    }
  }
}
