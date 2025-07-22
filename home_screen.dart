// home_screen.dart import 'package:flutter/material.dart'; import '../widgets/task_card.dart'; import '../widgets/level_badge.dart'; import '../widgets/daily_summary.dart'; import '../models/task.dart';

class HomeScreen extends StatefulWidget { const HomeScreen({super.key});

@override State<HomeScreen> createState() => _HomeScreenState(); }

class _HomeScreenState extends State<HomeScreen> { List<Task> tasks = [ Task( title: "Wake Up at 6 AM", durationMinutes: 10, category: TaskCategory.urgentImportant, ), Task( title: "30-min Exercise", durationMinutes: 30, category: TaskCategory.importantNotUrgent, ), Task( title: "Study for 2 hrs", durationMinutes: 120, category: TaskCategory.urgentImportant, ), Task( title: "Anime episode", durationMinutes: 25, category: TaskCategory.notUrgentNotImportant, ), ];

void toggleTaskDone(Task task) { setState(() { task.isCompleted = !task.isCompleted; }); }

@override Widget build(BuildContext context) { return Scaffold( appBar: AppBar( title: const Text("Solo Up"), actions: const [LevelBadge(level: 2)], ), body: Column( children: [ const DailySummary(), Expanded( child: ListView.builder( itemCount: tasks.length, itemBuilder: (context, index) => TaskCard( task: tasks[index], onChanged: () => toggleTaskDone(tasks[index]), ), ), ), ], ), ); } }

