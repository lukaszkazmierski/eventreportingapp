
import 'package:hive/hive.dart';

part 'settings.g.dart';

@HiveType(typeId: 0)
class Settings {
  @HiveField(0)
  bool darkMode;
  @HiveField(1)
  bool intro;
  @HiveField(2)
  String viewMode;
}