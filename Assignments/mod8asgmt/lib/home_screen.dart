import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:intl/intl.dart';

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

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<Task> tasks = [];
  DateTime? _selectedDateTime;

  Future<void> _selectDateTime() async {
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDateTime != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDateTime.year,
            pickedDateTime.month,
            pickedDateTime.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          _textEditingDateTimeController.text = _selectedDateTime.toString();
        });
      }
    }
  }

  void _editTask(Task task) {
    setState(() {
      task.title = _titleController.text.trim();
      task.description = _descriptionController.text.trim();

      task.deadline = _selectedDateTime!;
    });
  }

  void _deleteTask(Task task) {
    setState(() {
      tasks.remove(task);
      _resetFields();
    });
  }

  void _resetFields() {
    _titleController.clear();
    _descriptionController.clear();
    _textEditingDateTimeController.clear();
  }

  void _openTaskDetails(Task task, int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _resetFields();
    });

    _titleController.text = task.title;
    _descriptionController.text = task.description;
    _selectedDateTime = task.deadline;

    scaffoldKey.currentState!.showBottomSheet(
      (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              // width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors
                            .redAccent, // Set the desired background color
                      ),
                      child: Icon(FontAwesomeIcons.squareXmark),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Task Details',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Title: ${task.title}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Description: ${task.description}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Deadline: ${DateFormat('yyyy-MM-dd HH:mm').format(task.deadline)}',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedDateTime = task.deadline;
                              });
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
                                                suffixIcon: Icon(
                                                    Icons.text_fields_rounded),
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
                                              controller:
                                                  _descriptionController,
                                              maxLines: 2,
                                              decoration: InputDecoration(
                                                labelText: 'Enter description',
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black),
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                                suffixIcon: Icon(
                                                    Icons.description_rounded),
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
                                                suffixIcon: Icon(Icons
                                                    .calendar_month_rounded),
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
                                              _editTask(task);
                                              if (mounted) {
                                                setState(() {});
                                              }
                                              Navigator.pop(context);
                                            }
                                            Navigator.pop(context);
                                          },
                                          child: Text('Update Save'),
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: Text('Edit task'),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              _deleteTask(task);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors
                                  .redAccent, // Set the desired background color
                            ),
                            child: const Text('Delete'),
                          ),
                        ],
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
      key: scaffoldKey,
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
          IconButton(
            onPressed: () {
              if (tasks.isEmpty) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Expanded(
                          child: AlertDialog(
                        title: Text('No item found'),
                        actions: [
                          OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Okay')),
                        ],
                      ));
                    });
              } else {
                MyAlertDialog(context);
              }
            },
            icon: const Icon(FontAwesomeIcons.circleXmark),
          )
        ],
      ),
      body: ListView.separated(
        itemCount: tasks.length,
        separatorBuilder: (BuildContext context, int index) {
          return Container();
        },
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Container(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: const Color.fromARGB(255, 111, 118, 191),
              ),
              child: ListTile(
                  leading: Checkbox(
                    checkColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          7.0), // Adjust the circular radius here
                    ),
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return const Color.fromARGB(255, 224, 224, 255);
                      },
                    ),
                    value: task.isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        task.isChecked = value ?? false;
                      });
                    },
                  ),
                  onTap: () {
                    setState(() {
                      task.isChecked = !task.isChecked;
                    });
                  },
                  title: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      tasks[index].title,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tasks[index].description,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onLongPress: () {
                    _openTaskDetails(tasks[index], index);
                  }),
            ),
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
                          maxLines: 2,
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
                            title: _titleController.text.trim(),
                            description: _descriptionController.text.trim(),
                            deadline: _selectedDateTime!,
                            isChecked: false,
                          ));
                          if (mounted) {
                            setState(() {});
                          }
                          _resetFields();
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

  MyAlertDialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
              child: AlertDialog(
            title: Text('Do you want to delete permanently?'),
            actions: [
              OutlinedButton(
                  onPressed: () {
                    tasks.clear();
                    if (mounted) {
                      setState(() {});
                    }
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor:
                        Colors.redAccent, // Set the desired background color
                  ),
                  child: Text('Yes')),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No')),
            ],
          ));
        });
  }
}

class Task {
  String title, description;
  DateTime deadline;
  bool isChecked;

  Task(
      {required this.title,
      required this.description,
      required this.deadline,
      required this.isChecked});
}
