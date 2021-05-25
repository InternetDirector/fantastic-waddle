import 'package:flutter/material.dart';

import 'about_dev.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class TodoItem {
  final String text;
  final bool workDone;

  TodoItem(this.text, this.workDone);

  TodoItem copyWith({String text, bool workDone}) {
    return TodoItem(text ?? this.text, workDone ?? this.workDone);
  }
}

class _TodoListState extends State<TodoList> {
  final _list = <TodoItem>[];
  final contrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Заголовок'),
            ),
            ListTile(
              title: Text('О разработчике'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutDev()));
              },
            ),
          ],
        ),
      ),
      body: _buildTodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Add task'),
            content: TextField(controller: contrl),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop('Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop('OK');
                  _addTodoItem(contrl.text);
                  contrl.text = "";
                },
                child: const Text('OK'),
              ),
            ],
          ),
        ),
        tooltip: 'Add task',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: _list.length,
      itemBuilder: (context, index) {
        return _buildTodoItem(_list[index], index);
      },
    );
  }

  Widget _buildTodoItem(TodoItem a, int index) {
    final item = _list[index];
    return CheckboxListTile(
        title: Text(item.text),
        value: item.workDone,
        onChanged: (value) {
          setState(() {
            final newItem = item.copyWith(workDone: value);
            _list[index] = newItem;
          });
        });
  }

  void _addTodoItem(String n) {
    setState(() => _list.add(TodoItem(n, false)));
  }
}
