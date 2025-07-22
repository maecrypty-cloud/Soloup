import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'add_task_screen.dart';

void main() {
  runApp(const SoloUpApp());
}

class SoloUpApp extends StatelessWidget {
  const SoloUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solo Up',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/add': (context) => const AddTaskScreen(),
      },
    );
  }
}
