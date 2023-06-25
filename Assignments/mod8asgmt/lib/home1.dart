import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  //const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();

  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 22,
        title: const Text('Home'),
        actions: [
          IconButton(
              icon: ThemeProvider.controllerOf(context).currentThemeId ==
                      'custom_theme_dark'
                  ? Icon(Icons.lightbulb_outline)
                  : Icon(Icons.lightbulb_rounded),
              onPressed: () {
                ThemeProvider.controllerOf(context).nextTheme();
              }),
          IconButton(
            onPressed: () {
              if (todos.isEmpty) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Expanded(
                          child: AlertDialog(
                        title: Text('No item found'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Okay')),
                        ],
                      ));
                    });
              } else {
                MyAletrtDialog(context);
              }
            },
            icon: const Icon(Icons.highlight_remove),
          )
        ],
      ),
      body: ListView.separated(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: todos[index].isDone
                  ? const Color.fromARGB(255, 3, 73, 39)
                  : Colors.redAccent,
            ),
            child: ListTile(
              onLongPress: () {
                todos[index].isDone = !todos[index].isDone;
                if (mounted) {
                  setState(() {});
                }
              },
              title: Text(todos[index].title),
              subtitle: Text(
                todos[index].description,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      _titleTEController.text = todos[index].title;
                      _descriptionTEController.text = todos[index].description;

                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                const Text(
                                  'Edit Todo',
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: _titleTEController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter Title',
                                      hintText: 'Title',
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: _descriptionTEController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter Description',
                                      hintText: 'Description',
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (_titleTEController.text
                                            .trim()
                                            .isNotEmpty &&
                                        _descriptionTEController.text
                                            .trim()
                                            .isNotEmpty) {
                                      todos[index].title =
                                          _titleTEController.text.trim();
                                      todos[index].description =
                                          _descriptionTEController.text.trim();
                                      if (mounted) {
                                        setState(() {});
                                      }
                                      _titleTEController.clear();
                                      _descriptionTEController.clear();
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: const Text('Edit Todo'),
                                )
                              ],
                            ),
                          );
                          //     return Container(
                          //       height: 200,
                          //       child: Center(
                          //         child: Text('Bottom Modal Sheet'),
                          //       ),
                          //     );
                        },
                      );
                    },
                    child: Icon(Icons.edit),
                  ),
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      todos.removeAt(index);
                      if (mounted) {
                        setState(() {});
                      }
                    },
                    child: Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 0,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Do you want to delete permanently?'),
                  content: Column(
                    children: [
                      TextField(
                        controller: _titleTEController,
                        decoration: InputDecoration(hintText: 'Name'),
                      ),
                      TextField(
                        controller: _descriptionTEController,
                        decoration: InputDecoration(hintText: 'Name'),
                      ),
                      TextField(
                        decoration: InputDecoration(hintText: 'Name'),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          if (_titleTEController.text.trim().isNotEmpty &&
                              _descriptionTEController.text.trim().isNotEmpty) {
                            todos.add(Todo(_titleTEController.text.trim(),
                                _descriptionTEController.text.trim(), false));
                            if (mounted) {
                              setState(() {});
                            }
                            _titleTEController.clear();
                            _descriptionTEController.clear();
                            Navigator.pop(context);
                          }
                        },
                        child: Text('add')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('cancel')),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  MyAletrtDialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
              child: AlertDialog(
            title: Text('Do you want to delete permanently?'),
            actions: [
              TextButton(
                  onPressed: () {
                    todos.clear();
                    if (mounted) {
                      setState(() {});
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No')),
            ],
          ));
        });
  }
}

class Todo {
  String title, description;
  bool isDone;

  Todo(this.title, this.description, this.isDone);
}
