import 'dart:developer';

import 'package:flutter/material.dart';

import 'task_model.dart';

class TaskViewModel extends ChangeNotifier {
  List<Task> tasks = [];

  String? taskName;
  final datecont = TextEditingController();
  final timecont = TextEditingController();

  bool get isValid =>
      taskName != null && datecont.text.isNotEmpty && timecont.text.isNotEmpty;

  setTaskName(String? value) {
    taskName = value;
    print(value.toString());
    notifyListeners();
  }

  setDate(DateTime? date) {
    if (date == null) {
      return;
    }
    log(date.toString());
    DateTime currentdate = DateTime.now();
    DateTime now =
        DateTime(currentdate.year, currentdate.month, currentdate.day);
    int diff = date.difference(now).inDays;
    if (diff == 0) {
      datecont.text = "Today";
    } else if (diff == 1) {
      datecont.text = "Tommorow";
    } else {
      datecont.text = "${date.day} - ${date.month} - ${date.year}";
    }
    notifyListeners();
  }

  setTime(TimeOfDay? time) {
    if (time == null) {
      return;
    }
    log(time.toString());
    if (time.hour == 0) {
      timecont.text = "12:${time.minute} AM";
    } else if (time.hour < 12) {
      timecont.text = "${time.hour}:${time.minute} AM";
    } else if (time.hour == 12) {
      timecont.text = "${time.hour}:${time.minute} PM";
    } else {
      timecont.text = "${time.hour - 12}:${time.minute} PM";
    }
  }

  addTask() {
    if (!isValid) {
      return;
    }
    final task =
        Task(taskName: taskName!, date: datecont.text, time: timecont.text);
    tasks.add(task);
    datecont.clear();
    timecont.clear();
    log(tasks.length.toString());
    notifyListeners();
  }

  clearTask() {
    tasks.clear();
    notifyListeners();
  }
}
