import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFFBC02D),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF8B4513)),
        scaffoldBackgroundColor: Color(0xFFFFECB3),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFFBC02D),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'CreatoDisplay',
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color.fromARGB(255, 252, 218, 67),
          selectedItemColor: Color(0xFF8B4513),
          unselectedItemColor: Color(0xFF8B4513),
        ),
        textTheme: TextTheme(
          bodyLarge:
              TextStyle(color: Color(0xFF8B4513), fontFamily: 'CreatoDisplay'),
          bodyMedium:
              TextStyle(color: Color(0xFF8B4513), fontFamily: 'CreatoDisplay'),
        ),
      ),
    );
  }
}
