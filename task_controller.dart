// lib/controllers/task_controller.dart

import '../models/user_model.dart';

class TaskController { UserModel user = UserModel();

void completeTask({required int xpEarned}) { user.gainXP(xpEarned); }

void missTask({bool usedForgive = false}) { if (usedForgive) { user.useForgive(); } else { user.xp = (user.xp - 10 < 0) ? 0 : user.xp - 10; } }

void endOfDayReport({required bool allTasksDone}) { user.updateStreak(allTasksDone); }

void resetDailyForgives() { user.resetForgives(); }

bool get isForgiveLimitReached => user.tooManyForgives; int get currentXP => user.xp; int get currentLevel => user.level; int get currentStreak => user.streak; List<String> get earnedBadges => user.badges; List<String> get unlockedCharacters => user.unlockedCharacters; }

