import 'package:flutter/material.dart';

import 'package:todo_app/widgets/new_todo.dart';
import 'package:todo_app/widgets/todos_list/todos_list.dart';
import 'package:todo_app/models/todo.dart';

class Todos extends StatefulWidget {
  const Todos({super.key});

  @override
  State<Todos> createState() {
    return _TodosState();
  }
}

class _TodosState extends State<Todos> {
  final List<Todo> _registeredTodos = [
    Todo(
      action: '資料を作成する',
      date: DateTime.now(),
      priority: Priority.high,
    ),
    Todo(
      action: 'メールを送信する',
      date: DateTime.now(),
      priority: Priority.low,
    ),
  ];

  void _openAddTodoOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Todo todo) {
    setState(() {
      _registeredTodos.add(todo);
    });
  }

  void _removeTodo(Todo todo) {
    final expenseIndex = _registeredTodos.indexOf(todo);
    setState(() {
      _registeredTodos.remove(todo);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredTodos.insert(expenseIndex, todo);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('todoがありません。'),
    );

    if (_registeredTodos.isNotEmpty) {
      mainContent = TodosList(
        todos: _registeredTodos,
        onRemoveExpense: _removeTodo,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('todoリスト'),
        actions: [
          IconButton(
            onPressed: _openAddTodoOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(children: [
              Expanded(
                child: mainContent,
              ),
            ]),
    );
  }
}
