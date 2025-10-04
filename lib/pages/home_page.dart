import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to Flutter", style: 
            TextStyle(fontSize: 40, 
            color: Colors.blue,
            fontWeight: FontWeight.bold
            )
          ),

        ),

      ),
      drawer: Drawer(),
      
      
        
    );
  }
}