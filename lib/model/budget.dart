import 'package:hive/hive.dart';
import 'expense.dart';

part 'budget.g.dart'; // Gerado automaticamente pelo Hive

@HiveType(typeId: 1)
class Budget extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  List<Expense> expenses;

  @HiveField(3)
  double maxValue;

  @HiveField(4)
  DateTime endDate;

  @HiveField(5)
  bool isNegative;

  Budget({
    required this.id,
    required this.name,
    required this.expenses,
    required this.maxValue,
    required this.endDate,
    required this.isNegative,
  });

  void addExpense(Expense ex){
    expenses.add(ex);
  }

  /// Método para calcular o total gasto
  double get totalSpent => expenses.fold(0, (sum, item) => sum + item.value);

  /// Verifica se o orçamento está negativo
  bool get checkNegative => totalSpent > maxValue;
}
