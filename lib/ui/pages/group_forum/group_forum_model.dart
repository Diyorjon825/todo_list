import 'package:flutter/material.dart';
import 'package:todo_list/domain/data/group/group.dart';
import 'package:todo_list/domain/data_provider/data_provider.dart';

class GroupForumModel extends ChangeNotifier {
  String newGroupText = "";

  Future<void> saveGroup(BuildContext context) async {
    if (newGroupText.isEmpty) return;
    final groupBox = await BoxProvider.instances.openGroupBox();
    final newGroup = Group(newGroupText);
    await groupBox.add(newGroup);
    Navigator.pop(context);
  }
}
