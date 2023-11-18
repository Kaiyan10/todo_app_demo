import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Priority {
  high("高"),
  middle("中"),
  low('低'),
  ;

  const Priority(this.displayName);

  final String displayName;
}

class Todo {
  Todo({required this.action, required this.date, required this.priority})
      : id = uuid.v4();

  final String id;
  final String action;
  final DateTime date;
  final Priority priority;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Todo> allExpenses)
      : expenses = allExpenses.toList();

  final List<Todo> expenses;
}
