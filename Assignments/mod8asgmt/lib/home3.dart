import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Management List'),
      ),
      body: ListView.separated(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].title),
            subtitle: Text(tasks[index].description),
            onTap: () => _openTaskDetails(tasks[index]),
            onLongPress: () => _showDeleteTaskBottomSheet(tasks[index]),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 0,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog() {
    String title = '';
    String description = '';
    String deadline = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                onChanged: (value) => title = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Description'),
                onChanged: (value) => description = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Deadline'),
                onChanged: (value) {
                  deadline = value;
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (title.isNotEmpty &&
                    description.isNotEmpty &&
                    deadline.isNotEmpty) {
                  final newTask = Task(
                    title: title,
                    description: description,
                    deadline: deadline,
                  );
                  setState(() {
                    tasks.add(newTask);
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _openTaskDetails(Task task) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Task Details',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text('Title: ${task.title}'),
              Text('Description: ${task.description}'),
              Text('Deadline: ${task.deadline.toString()}'),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    tasks.remove(task);
                  });
                  Navigator.of(context).pop();
                },
                child: Text('Delete'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeleteTaskBottomSheet(Task task) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Delete Task',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text('Are you sure you want to delete this task?'),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    tasks.remove(task);
                  });
                  Navigator.of(context).pop();
                },
                child: Text('Delete'),
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
  final String description;
  final String deadline;

  Task({
    required this.title,
    required this.description,
    required this.deadline,
  });
}
