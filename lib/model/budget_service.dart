import 'package:hive/hive.dart';
import 'budget.dart';
import 'expense.dart';
import 'package:uuid/uuid.dart';

class BudgetService {
  final String boxName = 'box_budget';
  final Uuid uuid = Uuid();

  Future<Box<Budget>> _openBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<Budget>(boxName);
    }
    return Hive.box<Budget>(boxName);
  }

  /// Criar um novo orçamento
  Future<void> createBudget(String name, double maxValue, DateTime endDate) async {
    final box = await _openBox();
    Budget newBudget = Budget(
      id: uuid.v4(),
      name: name,
      expenses: [],
      maxValue: maxValue,
      endDate: endDate,
      isNegative: false,
    );
    await box.put(newBudget.id, newBudget);
  }

  /// Adicionar despesa a um orçamento existente
  Future<void> addExpense(String budgetId, Expense expense) async {
    final box = await _openBox();
    Budget? budget = box.get(budgetId);

    if (budget != null) {
      budget.addExpense(expense);
      budget.isNegative = budget.checkNegative;
      await box.put(budgetId, budget);
    }
  }

  /// Remover uma despesa específica
  Future<void> removeExpense(String budgetId, String id) async {
    final box = await _openBox();
    Budget? budget = box.get(budgetId);

    if (budget != null) {
      budget.expenses.removeWhere((expense) => expense.id == id);
      budget.isNegative = budget.checkNegative;
      await box.put(budgetId, budget);
    }
  }

  /// Buscar todos os orçamentos
  Future<List<Budget>> getAllBudgets() async {
    final box = await _openBox();
    return box.values.toList();
  }

  /// Buscar um orçamento pelo ID
  Future<Budget?> getBudgetById(String id) async {
    final box = await _openBox();
    return box.get(id);
  }

  /// Atualizar um orçamento
  Future<void> updateBudget(Budget budget) async {
    final box = await _openBox();
    await box.put(budget.id, budget);
  }

  /// Remover um orçamento
  Future<void> deleteBudget(String id) async {
    final box = await _openBox();
    await box.delete(id);
  }

  /// Listar apenas os orçamentos que ainda não encerraram
  Future<List<Budget>> getActiveBudgets() async {
    final box = await _openBox();
    return box.values.where((b) => b.endDate.isAfter(DateTime.now())).toList();
  }

  /// Limpar todos os orçamentos (somente para debug)
  Future<void> clearAllBudgets() async {
    final box = await _openBox();
    await box.clear();
  }
}
