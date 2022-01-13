import 'package:hive_flutter/hive_flutter.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  String task;
  @HiveField(1)
  bool isDone;
  Task({required this.task, required this.isDone});
}
