// widgets/task_card.dart

import 'package:flutter/material.dart'; import '../models/task.dart';

class TaskCard extends StatelessWidget { final Task task; final VoidCallback onComplete;

const TaskCard({super.key, required this.task, required this.onComplete});

@override Widget build(BuildContext context) { return Card( margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), color: Colors.deepPurple[800], child: ListTile( leading: Checkbox( value: task.isCompleted, onChanged: (_) => onComplete(), ), title: Text( task.title, style: TextStyle( decoration: task.isCompleted ? TextDecoration.lineThrough : null, color: Colors.white, ), ), subtitle: Text( "Duration: ${task.durationMinutes} min  |  XP: ${task.xp}", style: const TextStyle(color: Colors.white70), ), trailing: _buildCategoryTag(task.category), ), ); }

Widget _buildCategoryTag(TaskCategory category) { String label; Color color; switch (category) { case TaskCategory.urgentImportant: label = "Do Now"; color = Colors.red; break; case TaskCategory.importantNotUrgent: label = "Plan"; color = Colors.orange; break; case TaskCategory.urgentNotImportant: label = "Delegate"; color = Colors.green; break; case TaskCategory.notUrgentNotImportant: label = "Eliminate"; color = Colors.grey; break; } return Container( padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration( borderRadius: BorderRadius.circular(12), color: color, ), child: Text( label, style: const TextStyle(color: Colors.white, fontSize: 12), ), ); } }

