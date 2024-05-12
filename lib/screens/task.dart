import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/view_model/task_model.dart';

import '../constants/colors_widget.dart';
import '../view_model/task_viewmodel.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    final taskprovider = Provider.of<TaskViewModel>(context, listen: false);
    return ListTile(
      title: Text(
        task.taskName,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal),
      ),
      subtitle: Text(
        "${task.date} , ${task.time}",
        style: const TextStyle(
          color: blue,
        ),
      ),
      trailing: SizedBox(
        child: InkWell(
          onTap: () async {
            await taskprovider.clearTask();
          },
          child: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
