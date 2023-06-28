import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Management'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(task.title),
            onTap: () {
              _openTaskDetails(task);
            },
            onLongPress: () {
              _showBottomSheet(task);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddTaskDialog,
        child: Icon(Icons.add),
      ),
    );
  }

  void _openAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) {
        String title = '';

        return AlertDialog(
          title: Text('Add Task'),
          content: TextField(
            onChanged: (value) {
              title = value;
            },
            decoration: InputDecoration(
              labelText: 'Title',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tasks.add(Task(title: title));
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _openTaskDetails(Task task) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Task Details'),
          content: Text(task.title),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showBottomSheet(Task task) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Task Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text('Title: ${task.title}'),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      tasks.remove(task);
                    });
                    Navigator.pop(context);
                  },
                  child: Text('Delete Task'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Task {
  final String title;

  Task({required this.title});
}
