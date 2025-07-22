import 'package:flutter/material.dart';

class XPScreen extends StatelessWidget {
  final int currentXP;
  final int currentLevel;
  final int xpForNextLevel;

  const XPScreen({
    Key? key,
    required this.currentXP,
    required this.currentLevel,
    required this.xpForNextLevel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double progress = currentXP / xpForNextLevel;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("XP & Level", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text("Level $currentLevel", style: const TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Stack(
              children: [
                Container(
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[800],
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: progress.clamp(0.0, 1.0),
                  child: Container(
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text("$currentXP / $xpForNextLevel XP", style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 30),
            if (currentXP >= xpForNextLevel)
              Column(
                children: const [
                  Text("🎉 Level Up!", style: TextStyle(fontSize: 24, color: Colors.amber, fontWeight: FontWeight.bold)),
                  Text("You've unlocked a new anime character!", style: TextStyle(color: Colors.white)),
                ],
              )
          ],
        ),
      ),
    );
  }
}
