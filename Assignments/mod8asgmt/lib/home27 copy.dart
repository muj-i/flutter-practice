import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theme_provider/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formValidationKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  TextEditingController _textEditingController = TextEditingController();
  DateTime? _selectedDateTime;

  List<Task> tasks = [];

  Future<void> _selectDateTime() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          _textEditingController.text = _selectedDateTime.toString();
        });
      }
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 50,
        title: const Text('Task Management List'),
        actions: [
          IconButton(
              icon: ThemeProvider.controllerOf(context).currentThemeId ==
                      'custom_theme_dark'
                  ? const Icon(FontAwesomeIcons.lightbulb)
                  : const Icon(FontAwesomeIcons.solidLightbulb),
              onPressed: () {
                ThemeProvider.controllerOf(context).nextTheme();
              }),
        ],
      ),
      body: ListView.separated(
        itemCount: tasks.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1,
          );
        },
        itemBuilder: (context, index) {
          return Container(
            child: ListTile(
                title: Text(tasks[index].title),
                subtitle: Text(tasks[index].description),
                onLongPress: () {}),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Add New Task"),
                  content: Form(
                    key: _formValidationKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _titleController,
                          decoration: InputDecoration(hintText: 'Tittle'),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Please enter a tittle.';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _descriptionController,
                          decoration: InputDecoration(hintText: 'Description'),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Please enter a description.';
                            }
                            return null;
                          },
                        ),
                        TextField(
                          controller: _textEditingController,
                          readOnly: true,
                          onTap: _selectDateTime,
                          decoration: InputDecoration(
                            labelText: 'Select Date and Time',
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formValidationKey.currentState!.validate()) {
                          tasks.add(Task(
                            _titleController.text.trim(),
                            _descriptionController.text.trim(),
                          ));
                          if (mounted) {
                            setState(() {});
                          }
                          _titleController.clear();
                          _descriptionController.clear();
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Save'),
                    )
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

////void _addTaskAlertDialog() {}

class Task {
  String title, description;

  Task(this.title, this.description);
}
