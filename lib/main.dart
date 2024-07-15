import 'package:flutter/material.dart';

import './screens/loading.dart';
import './screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),


      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/home': (context) => HomePage()
      }, 
    );
  }
}

