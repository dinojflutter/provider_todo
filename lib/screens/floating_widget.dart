import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/constants/colors_widget.dart';
import 'package:provider_todo/view_model/task_viewmodel.dart';

import 'text_style.dart';

class Floatingwidget extends StatelessWidget {
  const Floatingwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return const Screendialog();
            });
      },
      backgroundColor: Colors.blue,
      child: const Icon(Icons.add),
    );
  }
}

class Screendialog extends StatelessWidget {
  const Screendialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    final taskprovider = Provider.of<TaskViewModel>(context, listen: false);

    return Dialog(
      backgroundColor: secondarycolor,
      child: SizedBox(
        height: sh * 0.55,
        width: sw * 0.8,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: sw * 0.05, vertical: sh * 0.01),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    "Create New Task",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: sh * 0.02,
                ),
                const Text(
                  "What is to be done?",
                  style: TextStyle(
                    color: blue,
                  ),
                ),
                TextWidget(
                  hint: "Enter a Task",
                  onChanged: (value) {
                    taskprovider.setTaskName(value);
                  },
                ),
                SizedBox(
                  height: sh * 0.04,
                ),
                const Text(
                  "Due Date",
                  style: TextStyle(
                    color: blue,
                  ),
                ),
                TextWidget(
                  hint: "Enter a Date",
                  icon: Icons.calendar_month,
                  ontap: () async {
                    DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2017),
                      lastDate: DateTime(2026),
                    );
                    taskprovider.setDate(date);
                  },
                  readonly: true,
                  controller: taskprovider.datecont,
                ),
                TextWidget(
                  hint: "Enter a Time",
                  icon: Icons.timer,
                  ontap: () async {
                    TimeOfDay? time = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
                    taskprovider.setTime(time);
                  },
                  readonly: true,
                  controller: taskprovider.timecont,
                ),
                SizedBox(
                  height: sh * 0.04,
                ),
                Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () async {
                          await taskprovider.addTask();
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          "Create",
                          style: TextStyle(color: Colors.black),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
