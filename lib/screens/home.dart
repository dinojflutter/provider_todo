import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/constants/colors_widget.dart';
import 'package:provider_todo/view_model/task_viewmodel.dart';

import 'floating_widget.dart';
import 'task.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: secondarycolor,
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: const Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: Icon(Icons.check),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "To Do List",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Consumer<TaskViewModel>(builder: (context, taskprovider, _) {
        return ListView.separated(
            itemBuilder: (context, index) {
              final task = taskprovider.tasks[index];
              return TaskWidget(
                task: task,
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 1,
                thickness: 1,
                color: blue,
              );
            },
            itemCount: taskprovider.tasks.length);
      }),
      floatingActionButton: const Floatingwidget(),
    );
  }
}
