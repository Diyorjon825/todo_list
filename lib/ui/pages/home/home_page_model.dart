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

  Future<void> _updateListGroup() async {
    final box = await _groupBox;
    _listGroup = box?.values.toList() ?? [];
    notifyListeners();
  }

  void setup() {
    _groupBox = BoxProvider.instances.openGroupBox();
    _taskBox = BoxProvider.instances.openTaskBox(currentGroup);
    _updateListGroup();
    _addGroupListener();
    notifyListeners();
  }

  void _addGroupListener() async {
    (await _groupBox)?.listenable().addListener(() => _updateListGroup());
  }

  void addNewTask(BuildContext context) =>
      Navigator.pushNamed(context, MainNavigationRoutes.homeForum);
}
