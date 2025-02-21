import 'package:flutter/material.dart';
import 'package:to_do_list_app/add_button.dart';
import 'package:to_do_list_app/update_to_do.dart';
import 'package:to_do_list_app/todo.dart';

class Todolistscreen extends StatefulWidget {
  const Todolistscreen({super.key});

  @override
  State<Todolistscreen> createState() => _TodolistscreenState();
}

class _TodolistscreenState extends State<Todolistscreen> {
  final List<Todo> listOfTodo = [];

  void _addTodo(Todo todo) {
    listOfTodo.add(todo);
    setState(() {});
  }

  void _deleteTodo(int index) {
    listOfTodo.removeAt(index);
    setState(() {});
  }

  void _updateTodo(int index, Todo todo) {
    listOfTodo[index] = todo;
    setState(() {});
  }

  void _updateTodoStatus(int index, TodoStatus status) {
    listOfTodo[index].status = status;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
        title: const Center(
          child: Text(
            "To Do List",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: Colors.blue[900],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/sakib1.jpg'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            'Md Sakib Al Hasan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'mdsakib124202@gmail.com',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact'),
            ),
          ],
        ),
      ),
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset('assets/images/todo5.png', fit: BoxFit.cover),
        ),
        Visibility(
          visible: listOfTodo.isNotEmpty,
          replacement: const Center(
            child: Text(
              "Empty Todo",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 20,
              ),
            ),
          ),
          child: ListView.builder(
              itemCount: listOfTodo.length,
              itemBuilder: (context, index) {
                Todo todo = listOfTodo[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        todo.title,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        todo.description,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                      ),
                      leading: Text(
                        todo.status.name,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                        ),
                      ),
                      trailing: Wrap(
                        children: [
                          IconButton(
                            onPressed: () {
                              _deleteTodo(index);
                            },
                            icon: const Icon(
                              Icons.delete_forever_outlined,
                              color: Colors.deepOrange,
                              size: 30,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Updatetodo(
                                            todo: todo,
                                            onupdateTodo: (Todo updateTodo) {
                                              _updateTodo(index, updateTodo);
                                            },
                                          )));
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Color.fromARGB(255, 1, 105, 153),
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        _showChangeDialouge(index);
                      },
                    ),
                    const Divider(
                      height: 0,
                      thickness: 1,
                      color: Color.fromARGB(255, 206, 245, 134),
                    ),
                  ],
                );
              }),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        onPressed: () async {
          Todo? todo = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Addbutton(),
            ),
          );
          if (todo != null) {
            _addTodo(todo);
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showChangeDialouge(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 239, 182, 97),
            title: const Text("Change Status"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text("Idle"),
                  onTap: () {
                    _onTapUpdateButton(index, TodoStatus.idle);
                  },
                ),
                const Divider(
                  height: 0,
                ),
                ListTile(
                  title: const Text("In Progress"),
                  onTap: () {
                    _onTapUpdateButton(index, TodoStatus.inProgress);
                  },
                ),
                const Divider(
                  height: 0,
                ),
                ListTile(
                  title: const Text("Done"),
                  onTap: () {
                    _onTapUpdateButton(index, TodoStatus.done);
                  },
                ),
              ],
            ),
          );
        });
  }

  void _onTapUpdateButton(int index, TodoStatus status) {
    _updateTodoStatus(index, status);
    Navigator.pop(context);
  }
}
