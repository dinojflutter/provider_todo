import 'dart:convert';

class Task {
  String taskName;
  String date;
  String time;
  Task({
    required this.taskName,
    required this.date,
    required this.time,
  });

  Task copyWith({
    String? taskName,
    String? date,
    String? time,
  }) {
    return Task(
      taskName: taskName ?? this.taskName,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'taskName': taskName,
      'date': date,
      'time': time,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      taskName: map['taskName'] ?? '',
      date: map['date'] ?? '',
      time: map['time'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() => 'Task(taskName: $taskName, date: $date, time: $time)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.taskName == taskName &&
        other.date == date &&
        other.time == time;
  }

  @override
  int get hashCode => taskName.hashCode ^ date.hashCode ^ time.hashCode;
}
