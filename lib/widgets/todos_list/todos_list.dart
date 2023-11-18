import 'package:flutter/material.dart';

import 'package:todo_app/widgets/todos_list/todo_item.dart';
import 'package:todo_app/models/todo.dart';

class TodosList extends StatelessWidget {
  const TodosList({
    super.key,
    required this.todos,
    required this.onRemoveExpense,
  });

  final List<Todo> todos;
  final void Function(Todo expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      itemCount: todos.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(todos[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          onRemoveExpense(todos[index]);
        },
        child: TodoItem(
          todos[index],
        ),
      ),
      onReorder: (oldIndex, newIndex) {
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final Todo item = todos.removeAt(oldIndex);
        todos.insert(newIndex, item);
      },
    );
  }
}
