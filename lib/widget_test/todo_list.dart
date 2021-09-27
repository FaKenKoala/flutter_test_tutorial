import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final todos = <String>[];
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
        ),
        body: Column(
          children: [
            TextField(
              controller: _controller,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      final todo = todos[index];
                      return Dismissible(
                        key: Key('$todo$index'),
                        child: ListTile(
                          title: Text(todo),
                        ),
                        onDismissed: (direction) => todos.removeAt(index),
                        background: Container(
                          color: Colors.red,
                        ),
                      );
                    })),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_controller.text.trim().isEmpty) {
              return;
            }
            setState(() {
              todos.add(_controller.text);
              _controller.clear();
            });
          },
        ),
      ),
    );
  }
}
