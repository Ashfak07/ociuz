import 'package:hive/hive.dart';
part 'reg_model.g.dart';

@HiveType(typeId: 1)
class Regmodel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final int mobile;
  @HiveField(3)
  final String designation;

  Regmodel(
      {required this.name,
      required this.email,
      required this.mobile,
      required this.designation});
}
