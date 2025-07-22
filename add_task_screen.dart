import 'package:flutter/material.dart';
import '../models/task.dart';

class AddTaskScreen extends StatefulWidget {
  final Function(Task) onTaskAdded;

  const AddTaskScreen({Key? key, required this.onTaskAdded}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();
  int _duration = 30;
  bool _isHabit = false;
  bool _repeatsDaily = false;
  DateTime? _dueTime;
  TaskCategory _category = TaskCategory.urgentImportant;

  Future<void> _pickDueTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      final now = DateTime.now();
      setState(() {
        _dueTime = DateTime(
          now.year,
          now.month,
          now.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      });
    }
  }

  void _submit() {
    if (_titleController.text.isEmpty) return;

    final newTask = Task(
      title: _titleController.text,
      durationMinutes: _duration,
      category: _category,
      isHabit: _isHabit,
      repeatsDaily: _repeatsDaily,
      dueTime: _dueTime,
    );

    widget.onTaskAdded(newTask);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Task")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: "Task Title"),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Text("Duration: $_duration min"),
                Expanded(
                  child: Slider(
                    min: 5,
                    max: 120,
                    divisions: 23,
                    value: _duration.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        _duration = value.round();
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            ElevatedButton.icon(
              icon: Icon(Icons.access_time),
              label: Text(_dueTime == null
                  ? "Pick Due Time"
                  : "Due: ${_dueTime!.hour}:${_dueTime!.minute.toString().padLeft(2, '0')}"),
              onPressed: _pickDueTime,
            ),
            SizedBox(height: 12),
            SwitchListTile(
              value: _isHabit,
              onChanged: (val) => setState(() => _isHabit = val),
              title: Text("Habit Task"),
            ),
            SwitchListTile(
              value: _repeatsDaily,
              onChanged: (val) => setState(() => _repeatsDaily = val),
              title: Text("Repeats Daily"),
            ),
            SizedBox(height: 12),
            DropdownButtonFormField<TaskCategory>(
              value: _category,
              decoration: InputDecoration(labelText: "Category"),
              items: TaskCategory.values.map((cat) {
                return DropdownMenuItem(
                  value: cat,
                  child: Text(cat.name.replaceAll(RegExp(r'([A-Z])'), ' \$1')),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) setState(() => _category = value);
              },
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submit,
              child: Text("Add Task"),
            ),
          ],
        ),
      ),
    );
  }
}
