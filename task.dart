// models/task.dart

enum TaskCategory {
  urgentImportant,
  importantNotUrgent,
  urgentNotImportant,
  notUrgentNotImportant,
}

class Task {
  String title;
  int durationMinutes;
  bool isCompleted;
  bool isHabit;
  bool isMissed;
  TaskCategory category;
  DateTime createdAt;
  DateTime? dueTime;
  bool repeatsDaily;

  Task({
    required this.title,
    required this.durationMinutes,
    required this.category,
    this.isCompleted = false,
    this.isHabit = false,
    this.isMissed = false,
    this.repeatsDaily = false,
    this.dueTime,
  }) : createdAt = DateTime.now();

  int get xp => durationMinutes * 2;

  void markCompleted() {
    isCompleted = true;
    isMissed = false;
  }

  void markMissed() {
    if (!isCompleted) {
      isMissed = true;
    }
  }

  bool get isOverdue {
    return dueTime != null && DateTime.now().isAfter(dueTime!) && !isCompleted;
  }
}
