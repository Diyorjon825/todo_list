import 'package:flutter/material.dart';
import 'package:todo_list/library/widget/provider.dart';
import 'package:todo_list/ui/pages/group_forum/group_forum_model.dart';
import 'package:todo_list/ui/pages/group_forum/group_forum_page.dart';
import 'package:todo_list/ui/pages/home/home_page.dart';
import 'package:todo_list/ui/pages/home/home_page_model.dart';

class MainNavigation {
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRoutes.homePage: (context) =>
        NotifierProvider(child: const HomePage(), model: HomePageModel()),
    MainNavigationRoutes.homeForum: (context) => NotifierProvider(
        child: const GroupForumWidget(), model: GroupForumModel()),
  };
  final initialRoute = MainNavigationRoutes.homePage;
}

abstract class MainNavigationRoutes {
  static const homePage = '/';
  static const homeForum = '/home_forum';
}
