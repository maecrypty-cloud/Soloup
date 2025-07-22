import 'package:flutter/material.dart'; import 'task.dart'; import 'add_task_screen.dart'; import 'task_card.dart';

class HomeScreen extends StatefulWidget { const HomeScreen({super.key});

@override State<HomeScreen> createState() => _HomeScreenState(); }

class _HomeScreenState extends State<HomeScreen> { List<Task> tasks = [];

void _addNewTask(Task task) { setState(() { tasks.add(task); }); }

void _navigateToAddTask() async { final Task? newTask = await Navigator.push( context, MaterialPageRoute( builder: (context) => AddTaskScreen(), ), ); if (newTask != null) { _addNewTask(newTask); } }

@override Widget build(BuildContext context) { return Scaffold( appBar: AppBar( title: const Text('Solo Up'), backgroundColor: Colors.deepPurpleAccent, ), body: tasks.isEmpty ? const Center( child: Text( 'No tasks yet. Add one!', style: TextStyle(color: Colors.white), ), ) : ListView.builder( itemCount: tasks.length, itemBuilder: (context, index) { return TaskCard( task: tasks[index], onComplete: () { setState(() { tasks[index].markCompleted(); }); }, ); }, ), floatingActionButton: FloatingActionButton( backgroundColor: Colors.purpleAccent, onPressed: _navigateToAddTask, child: const Icon(Icons.add), ), ); } }
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => XPScreen(
      currentXP: totalXP,
      currentLevel: level,
      xpForNextLevel: xpToLevelUp,
    ),
  ),
);
