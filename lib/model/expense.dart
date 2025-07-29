import 'package:hive/hive.dart';

part 'expense.g.dart'; // Arquivo gerado automaticamente

@HiveType(typeId: 0)
class Expense extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  double value;

  Expense({required this.id, required this.name, required this.value});
}
