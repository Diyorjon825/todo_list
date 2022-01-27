import 'package:flutter/material.dart';
import 'package:todo_list/domain/data/task/task.dart';
import 'package:todo_list/domain/data_provider/data_provider.dart';

class TaskForumModel extends ChangeNotifier {
  String textTask = '';
  final int groupKey;

  TaskForumModel(this.groupKey);
  void saveTask(BuildContext context) async {
    if (textTask.isEmpty) return;
    final taskBox = await BoxProvider.instances.openTaskBox(groupKey);
    final task = Task(task: textTask, isDone: false);
    taskBox.add(task);
    Navigator.pop(context);
  }
}
