import 'package:hive_flutter/hive_flutter.dart';

part 'group.g.dart';

@HiveType(typeId: 0)
class Group {
  @HiveField(0)
  String name;
  Group(this.name);
}
