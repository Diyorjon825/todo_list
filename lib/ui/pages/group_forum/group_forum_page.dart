import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:todo_list/library/widget/provider.dart';

import 'group_forum_model.dart';

class GroupForumWidget extends StatelessWidget {
  const GroupForumWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<GroupForumModel>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(56, 80, 156, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(56, 80, 156, 1),
        elevation: 0,
        title: const Text('Group Name'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => model?.saveGroup(context),
            icon: const Icon(Ionicons.checkmark),
          ),
        ],
      ),
      body: const GroupForumBodyWidget(),
    );
  }
}

class GroupForumBodyWidget extends StatelessWidget {
  const GroupForumBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<GroupForumModel>(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          onChanged: (text) => model?.newGroupText = text,
          style: const TextStyle(color: Colors.white),
          autofocus: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
