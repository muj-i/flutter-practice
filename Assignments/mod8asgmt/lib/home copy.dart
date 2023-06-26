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
  final TextEditingController _textEditingDateTimeController =
      TextEditingController();

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
          _textEditingDateTimeController.text = _selectedDateTime.toString();
        });
      }
    }
  }

  @override
  void dispose() {
    _textEditingDateTimeController.dispose();
    super.dispose();
  }

  void _openTaskDetails(Task task, int index) {
    _titleController.text = task.title;
    _descriptionController.text = task.description;
    _selectedDateTime = task.deadline;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
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
                  Row(
                    children: [
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Edit Task"),
                                  content: Form(
                                    key: _formValidationKey,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextFormField(
                                          controller: _titleController,
                                          decoration: InputDecoration(
                                            labelText: 'Enter tittle',
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            suffixIcon:
                                                Icon(Icons.text_fields_rounded),
                                          ),
                                          validator: (value) {
                                            if (value!.trim().isEmpty) {
                                              return 'Please enter a tittle.';
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        TextFormField(
                                          controller: _descriptionController,
                                          decoration: InputDecoration(
                                            labelText: 'Enter description',
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            suffixIcon:
                                                Icon(Icons.description_rounded),
                                          ),
                                          validator: (value) {
                                            if (value!.trim().isEmpty) {
                                              return 'Please enter a description.';
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        TextFormField(
                                          controller:
                                              _textEditingDateTimeController,
                                          readOnly: true,
                                          onTap: _selectDateTime,
                                          decoration: InputDecoration(
                                            labelText: 'Select deadline',
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            suffixIcon: Icon(
                                                Icons.calendar_month_rounded),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Please select a deadline.';
                                            }
                                            return null;
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors
                                            .redAccent, // Set the desired background color
                                      ),
                                      child: Text('Cancel'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (_formValidationKey.currentState!
                                            .validate()) {
                                          setState(() {
                                            task.title =
                                                _titleController.text.trim();
                                            task.description =
                                                _descriptionController.text
                                                    .trim();
                                            task.deadline = _selectedDateTime!;

                                            if (mounted) {
                                              setState(() {});
                                            }
                                            _titleController.clear();
                                            _descriptionController.clear();
                                            _textEditingDateTimeController
                                                .clear();
                                            Navigator.pop(context);
                                          });
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Text('Edit Save'),
                                    )
                                  ],
                                );
                              });
                        },
                        child: Text('edit'),
                      ),
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
                ],
              ),
            );
          },
        );
      },
    );
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
                subtitle: Column(
                  children: [
                    Text(tasks[index].description),
                    Text(
                      'Deadline: ${tasks[index].deadline}',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                onLongPress: () {
                  _openTaskDetails(tasks[index], index);
                }),
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            labelText: 'Enter tittle',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            suffixIcon: Icon(Icons.text_fields_rounded),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Please enter a tittle.';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            labelText: 'Enter description',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            suffixIcon: Icon(Icons.description_rounded),
                          ),
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Please enter a description.';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          controller: _textEditingDateTimeController,
                          readOnly: true,
                          onTap: _selectDateTime,
                          decoration: InputDecoration(
                            labelText: 'Select deadline',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            suffixIcon: Icon(Icons.calendar_month_rounded),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please select a deadline.';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors
                            .redAccent, // Set the desired background color
                      ),
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formValidationKey.currentState!.validate()) {
                          tasks.add(Task(
                            _titleController.text.trim(),
                            _descriptionController.text.trim(),
                            _selectedDateTime!,
                          ));
                          if (mounted) {
                            setState(() {});
                          }
                          _titleController.clear();
                          _descriptionController.clear();
                          _textEditingDateTimeController.clear();
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

class Task {
  String title, description;
  DateTime deadline;

  Task(this.title, this.description, this.deadline);
}
