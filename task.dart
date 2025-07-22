// models/task.dart

enum TaskCategory { urgentImportant, importantNotUrgent, urgentNotImportant, notUrgentNotImportant, }

class Task { String title; int durationMinutes; bool isCompleted; TaskCategory category; DateTime createdAt;

Task({ required this.title, required this.durationMinutes, required this.category, this.isCompleted = false, }) : createdAt = DateTime.now();

int get xp => durationMinutes * 2; }

