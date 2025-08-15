import 'package:auto_size_text/auto_size_text.dart';
import 'package:fin/add_budget.dart';
import 'package:fin/budget_appbar.dart';
import 'package:fin/budget_detail.dart';
import 'package:fin/model/budget_service.dart';
// import 'package:fin/model/expense.dart';
import 'package:flutter/foundation.dart';
import 'package:fin/model/budget.dart';
import 'package:flutter/material.dart';
import 'package:fin/main.dart';
import 'generated/l10n.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool firstLoad = true;
  bool isActiveFilter = true; // Estado do filtro (ativar/desativar)

  List<Budget> budgets = []; // Lista de orçamentos
  List<Budget> filteredBudgets = []; // Lista filtrada de orçamentos

  ValueNotifier<int> rebuildNumber = ValueNotifier<int>(0);

  bool isSameOrAfter(DateTime now, DateTime budget) {
    if (budget.year < now.year) {
      return false;
    }

    if (budget.year > now.year) {
      return true;
    }

    // Cases where year is the same
    if (budget.month < now.month) {
      return false;
    }

    if (budget.month > now.month) {
      return true;
    }

    // Cases where month is the same
    if (budget.day < now.day) {
      return false;
    }

    if (budget.month > now.month) {
      return true;
    }

    // Same year-month-day :)
    return true;
  }

  void updateList(Budget newItem) {
    setState(() {
      if (isSameOrAfter(DateTime.now(), newItem.endDate)) {
        filteredBudgets.add(newItem);
      }
      budgets.add(newItem);
    });
  }

  void _onFilterChanged(bool value) {
    setState(() {
      isActiveFilter = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BudgetAppBar(
        isActiveFilter: isActiveFilter,
        onFilterChanged: _onFilterChanged,
      ),
      body: FutureBuilder<List<Budget>>(
        future: budgetService.getAllBudgets(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            if (kDebugMode) {
              print("erro: ${snapshot.error.toString()}");
            }
            return Center(
              child: AutoSizeText(
                // 'Algo deu errado ao buscar pelos budgets\nTente fechar e abrir novamente!',
                S.of(context).mensagemErroAllBudgets,
                style: TextStyle(fontSize: 20),
                minFontSize: 15,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }

          if (firstLoad) {
            budgets = snapshot.data!;
            filteredBudgets =
                budgets
                    .where(
                      (budget) => isSameOrAfter(DateTime.now(), budget.endDate),
                    )
                    .toList();
            firstLoad = false;
          }

          if (budgets.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.warning, color: Colors.orange, size: 50),
                  SizedBox(height: 20),
                  AutoSizeText(
                    // 'Não há orçamentos cadastrados!',
                    S.of(context).mensagemSemBudgetCadastrado,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    minFontSize: 15,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          }

          if (isActiveFilter && filteredBudgets.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.warning, color: Colors.orange, size: 50),
                  SizedBox(height: 20),
                  AutoSizeText(
                    // 'Não há orçamentos ativos!',
                    S.of(context).mensagemSemBudgetAtivo,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    minFontSize: 15,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: isActiveFilter ? filteredBudgets.length : budgets.length,
            itemBuilder: (context, index) {
              Budget budget =
                  isActiveFilter ? filteredBudgets[index] : budgets[index];
              
              ValueNotifier<int> exps =  ValueNotifier(0); 
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.zero, // Remove padding of the ListTile
                      title: Text(
                        budget.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: ListenableBuilder(
                        listenable: exps,
                        builder:
                            (context, child) => Text(
                              "${S.of(context).gastos}: ${budget.totalSpent} / ${budget.maxValue}",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          await showDeleteConfirmationDialog(
                            context,
                            budget,
                            budgetService,
                            () {
                              setState(() {
                                filteredBudgets.removeWhere(
                                  (item) => item.id == budget.id,
                                );
                                budgets.removeWhere(
                                  (item) => item.id == budget.id,
                                );
                              });
                            },
                          );
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => BudgetDetailsPage(budget: budget, update: exps),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddBudgetDialog(
                budgetService: budgetService,
                onAddItem: updateList,
              );
            },
          );
        },
        child: Icon(Icons.add_rounded),
      ),
    );
  }
}

Future<void> showDeleteConfirmationDialog(
  BuildContext context,
  Budget budget,
  BudgetService budgetService,
  Function() onDeleted,
) async {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: Color(0xFFDCC7B0), // Cor de fundo do dialog
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                size: 50,
                color: Color(0xFF6F4E37), // Cor de ícone (marrom café)
              ),
              SizedBox(height: 16),
              Text(
                // 'Você tem certeza que deseja excluir este budget?',
                S.of(context).mensagemConfirmacaoExlcusao,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF3E2723), // Cor do texto
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Fechar o dialog
                    },
                    child: Text(
                      // 'Cancelar',
                      S.of(context).cancelar,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF6F4E37), // Cor dos botões
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () async {
                      // Excluir o orçamento
                      await budgetService.deleteBudget(budget.id);
                      onDeleted();
                      if (context.mounted) {
                        Navigator.of(context).pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                    ),
                    child: Text(S.of(context).excluir, style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
