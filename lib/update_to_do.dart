import 'package:flutter/material.dart';
import 'package:to_do_list_app/todo.dart';

class Updatetodo extends StatefulWidget {
  const Updatetodo({super.key, required this.todo, required this.onupdateTodo});

  final Todo todo;
  final Function(Todo) onupdateTodo;

  @override
  State<Updatetodo> createState() => _UpdatetodoState();
}

class _UpdatetodoState extends State<Updatetodo> {
  final TextEditingController _titleTEcontroller = TextEditingController();

  final TextEditingController _descriptionTEcontroller =
      TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _titleTEcontroller.text = widget.todo.title;
    _descriptionTEcontroller.text = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
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
            "Update Todo",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
        color: const Color.fromARGB(255, 88, 147, 175),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
                key: _key,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: _titleTEcontroller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Add Title";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        label: Text(
                          "Title",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: _descriptionTEcontroller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      maxLines: 3,
                      validator: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Add Title";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        label: Text(
                          "Description",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                              const Color.fromARGB(255, 8, 101, 144)),
                        ),
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            Todo todo = Todo(
                              title: _titleTEcontroller.text.trim(),
                              description: _descriptionTEcontroller.text.trim(),
                              status: widget.todo.status,
                            );
                            widget.onupdateTodo(todo);
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          "Update",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
