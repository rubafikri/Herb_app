import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:gsgass1/Ui/pages/addHerb.dart';
import 'package:gsgass1/Ui/pages/editHerb.dart';

import 'Ui/pages/Home.dart';
import 'Ui/pages/SplashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: App(),
  ));
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if (_error) {
      return Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Text('Exception occured'),
        ),
      );
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SplashScreen();
  }
}
