import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/domain/data/group/group.dart';
import 'package:todo_list/domain/data/task/task.dart';
import 'package:todo_list/domain/data_provider/data_provider.dart';
import 'package:todo_list/ui/navigation/main_navigation.dart';

class HomePageModel extends ChangeNotifier {
  var currentGroup = 0;
  Future<Box<Group>>? _groupBox;
  Future<Box<Task>>? _taskBox;

  List<Task> _listTask = <Task>[];
  List<Group> _listGroup = <Group>[];

  List<Task> get listTask => _listTask;
  List<Group> get listGroup => _listGroup;

  HomePageModel() {
    setup();
  }

  void setup() async {
    _groupBox = BoxProvider.instances.openGroupBox();

    _updateListGroup();
    _updateListTask();
    _addListener();
    notifyListeners();
  }

  Future<void> _updateListGroup() async {
    final box = await _groupBox;
    _listGroup = box?.values.toList() ?? [];
    notifyListeners();
  }

  Future<void> _updateListTask() async {
    final groupKey = (await _groupBox)?.keyAt(currentGroup) ?? 0;
    _taskBox = BoxProvider.instances.openTaskBox(groupKey);
    final box = await _taskBox;
    _listTask = box?.values.toList() ?? [];
    (await _taskBox)?.listenable().addListener(() => _updateListTask());
    notifyListeners();
  }

  void _addListener() async {
    (await _groupBox)?.listenable().addListener(() => _updateListGroup());
    notifyListeners();
  }

  void changeGroup(int index) {
    currentGroup = index;
    _updateListTask();
  }

  void addNewGroup(BuildContext context) {
    Navigator.pushNamed(
      context,
      MainNavigationRoutes.homeForum,
    );
  }

  void addNewTask(BuildContext context) async {
    final groupKey = (await _groupBox)?.keyAt(currentGroup) ?? 0;

    Navigator.pushNamed(
      context,
      MainNavigationRoutes.taskForum,
      arguments: groupKey,
    );
  }

  void deleteGroup(BuildContext context, int index) async {
    final groupBox = await _groupBox;
    final taskBox = await _taskBox;
    await taskBox?.deleteFromDisk();
    await groupBox?.deleteAt(index);
    Navigator.pop(context);
  }

  void deleteTask(int index) async {
    final taskBox = await _taskBox;
    await taskBox?.deleteAt(index);
  }
}
