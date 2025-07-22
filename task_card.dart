// widgets/task_card.dart

import 'package:flutter/material.dart';
import '../models/task.dart';
import 'package:intl/intl.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback onComplete;

  const TaskCard({
    Key? key,
    required this.task,
    required this.onComplete,
  }) : super(key: key);

  Color getCategoryColor(TaskCategory category) {
    switch (category) {
      case TaskCategory.urgentImportant:
        return Colors.redAccent;
      case TaskCategory.importantNotUrgent:
        return Colors.orangeAccent;
      case TaskCategory.urgentNotImportant:
        return Colors.yellow.shade700;
      case TaskCategory.notUrgentNotImportant:
        return Colors.greenAccent;
    }
  }

  IconData getCategoryIcon(TaskCategory category) {
    switch (category) {
      case TaskCategory.urgentImportant:
        return Icons.priority_high;
      case TaskCategory.importantNotUrgent:
        return Icons.schedule;
      case TaskCategory.urgentNotImportant:
        return Icons.notifications_active;
      case TaskCategory.notUrgentNotImportant:
        return Icons.self_improvement;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isOverdue = task.isOverdue;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: Icon(
          getCategoryIcon(task.category),
          color: getCategoryColor(task.category),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("⏱ ${task.durationMinutes} min  |  🧠 XP: ${task.xp}"),
            if (task.dueTime != null)
              Text(
                "🕒 Due: ${DateFormat.Hm().format(task.dueTime!)}",
                style: TextStyle(color: isOverdue ? Colors.red : Colors.grey[600]),
              ),
            if (task.isHabit) Text("🔁 Habit", style: TextStyle(color: Colors.blue)),
            if (task.isMissed) Text("⚠ Missed", style: TextStyle(color: Colors.orange)),
          ],
        ),
        trailing: Checkbox(
          value: task.isCompleted,
          onChanged: (_) => onComplete(),
        ),
      ),
    );
  }
}
