// lib/models/user_model.dart

class UserModel { int xp; int level; int streak; int forgivesUsed; List<String> badges; List<String> unlockedCharacters;

UserModel({ this.xp = 0, this.level = 1, this.streak = 0, this.forgivesUsed = 0, List<String>? badges, List<String>? unlockedCharacters, })  : badges = badges ?? [], unlockedCharacters = unlockedCharacters ?? [];

void gainXP(int amount) { xp += amount; if (xp >= level * 100) { level++; xp = 0; badges.add('Level $level Badge'); unlockedCharacters.add('Character Level $level'); } }

void useForgive() { forgivesUsed++; xp = (xp - 20 < 0) ? 0 : xp - 20; }

void resetForgives() { forgivesUsed = 0; }

void updateStreak(bool taskCompletedToday) { if (taskCompletedToday) { streak++; } else { streak = 0; } }

bool get tooManyForgives => forgivesUsed > 3; }

