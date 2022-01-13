import 'package:flutter/material.dart';
import 'package:todo_list/library/widget/provider.dart';
import 'package:todo_list/ui/pages/home_page/home_page.dart';
import 'package:todo_list/ui/pages/home_page/home_page_model.dart';

class MainNavigation {
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRoutes.homePage: (context) =>
        NotifierProvider(child: const HomePage(), model: HomePageModel()),
  };
  final initialRoute = MainNavigationRoutes.homePage;
}

abstract class MainNavigationRoutes {
  static const homePage = '/';
}
