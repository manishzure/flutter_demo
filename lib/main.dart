import 'package:demo/pages/home_page.dart';
import 'package:demo/pages/login_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      themeMode: ThemeMode.light,
      
      darkTheme: ThemeData(
        brightness: Brightness.light, 
      ),

      debugShowCheckedModeBanner: false, 

      routes: {
        "/": (context) => HomePage(),
        "/login": (context) => LoginPage(),
      },
    );
  }
} 



