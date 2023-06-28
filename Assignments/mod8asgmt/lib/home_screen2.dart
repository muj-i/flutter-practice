import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> tasks = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _textEditingDateTimeController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Management'),
      ),
      body: ListView(
        children: tasks.map((task) => TaskItem(task)).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('Add Task'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Description'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Deadline'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  child: Text('Save'),
                  onPressed: () {
                    // Add the new task to the list of tasks.
                    setState(() {
                      tasks.add(Task(
                        title: _titleController.text,
                        description: _descriptionController.text,
                        deadline: _textEditingDateTimeController.text,
                      ));
                    });

                    // Close the dialog.
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  final Task task;

  const TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text(task.description),
      trailing: Text(task.deadline),
    );
  }
}

class Task {
  final String title;
  final String description;
  final String deadline;

  Task({
    required this.title,
    required this.description,
    required this.deadline,
  });
}
