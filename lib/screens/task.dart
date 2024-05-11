import 'package:flutter/material.dart';
import 'package:provider_todo/view_model/task_model.dart';

import '../constants/colors_widget.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
    required this.task,
  });

  final Task task;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.taskName,
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal),
      ),
      subtitle: Text(
        "${task.date} , ${task.time}",
        style: TextStyle(
          color: blue,
        ),
      ),
    );
  }
}
