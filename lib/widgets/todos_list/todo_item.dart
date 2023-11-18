import 'package:flutter/material.dart';

import 'package:todo_app/models/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(this.todo, {super.key});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todo.action,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Row(
                  children: [
                    Text(todo.formattedDate),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 30,
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(todo.priority.displayName,
                      style: TextStyle(
                        fontSize: 10,
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
