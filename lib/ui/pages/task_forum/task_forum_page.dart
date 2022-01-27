import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:todo_list/library/widget/provider.dart';
import 'package:todo_list/ui/pages/task_forum/task_forum_model.dart';

class TaskForumWidget extends StatelessWidget {
  const TaskForumWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<TaskForumModel>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(56, 80, 156, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(56, 80, 156, 1),
        elevation: 0,
        title: const Text('Group Name'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => model?.saveTask(context),
            icon: const Icon(Ionicons.checkmark),
          ),
        ],
      ),
      body: const TaskForumBodyWidget(),
    );
  }
}

class TaskForumBodyWidget extends StatelessWidget {
  const TaskForumBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<TaskForumModel>(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        onChanged: (value) => model?.textTask = value,
        minLines: null,
        maxLines: null,
        expands: true,
        autofocus: true,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }
}
