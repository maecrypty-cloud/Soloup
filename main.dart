// main.dart import 'package:flutter/material.dart'; import 'package:solo_up/screens/home_screen.dart';

void main() { runApp(const SoloUpApp()); }

class SoloUpApp extends StatelessWidget { const SoloUpApp({super.key});

@override Widget build(BuildContext context) { return MaterialApp( title: 'Solo Up', debugShowCheckedModeBanner: false, theme: ThemeData.dark().copyWith( primaryColor: Colors.deepPurple, scaffoldBackgroundColor: const Color(0xFF121212), colorScheme: ColorScheme.dark( primary: Colors.deepPurple, secondary: Colors.purpleAccent, ), checkboxTheme: CheckboxThemeData( fillColor: MaterialStateProperty.all(Colors.deepPurpleAccent), ), ), home: const HomeScreen(), ); } }

