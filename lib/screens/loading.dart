import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // Add any loading tasks here (e.g., fetching data)
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.sizeOf(context).height;
    double sw = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/todoList.png', width: sw * 0.5, height: sh * 0.5,),    
            SizedBox(height: 5,),
            Text("DEG - ToDoList", style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w600, color: Colors.blue[500]),), 
            SizedBox(height: 16),
            CircularProgressIndicator(color: Colors.blue[700],),
          ],
        ),
      ),
    );
  }
}