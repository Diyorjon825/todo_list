import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/domain/data/group/group.dart';
import 'package:todo_list/domain/data/task/task.dart';

class BoxProvider {
  static final instances = BoxProvider._();
  BoxProvider._();
  Future<Box<Group>> openGroupBox() => _openBox('group_box', 0, GroupAdapter());
  Future<Box<Task>> openTaskBox(int groupKey) =>
      _openBox(makeNameTaskBox(groupKey), 1, TaskAdapter());

  String makeNameTaskBox(int groupKey) => 'task_box_$groupKey';

  void clouseBox<T>(Box<T> box) async {
    await box.compact();
    await box.close();
  }

  Future<Box<T>> _openBox<T>(
      String name, int typeId, TypeAdapter<T> adapter) async {
    if (!Hive.isAdapterRegistered(typeId)) {
      Hive.registerAdapter(adapter);
    }
    return await Hive.openBox<T>(name);
  }
}
