import 'package:flutter/material.dart';
import 'package:todo_list/ui/navigation/main_navigation.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigation = MainNavigation();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: _navigation.routes,
      initialRoute: _navigation.initialRoute,
    );
  }
}
