import 'package:fin/generated/l10n.dart';
import 'package:fin/model/budget.dart';
import 'package:fin/model/budget_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class AddBudgetDialog extends StatefulWidget {
  final BudgetService budgetService;
  final Function(Budget) onAddItem;
  const AddBudgetDialog({
    super.key,
    required this.budgetService,
    required this.onAddItem,
  });

  @override
  _AddBudgetDialogState createState() => _AddBudgetDialogState();
}

class _AddBudgetDialogState extends State<AddBudgetDialog> {
  final _formKey = GlobalKey<FormState>();
  late String budgetName;
  late double maxValue;
  late DateTime endDate;

  @override
  void initState() {
    super.initState();
    endDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Scrollbar(
          controller: scrollController,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Título do Formulário
                Text(
                  // 'Adicionar Novo Orçamento',
                  S.of(context).adicionarBudget,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 16),

                // Formulário
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Campo para o Nome do Orçamento
                      _buildTextField(
                        textInputAction: TextInputAction.next,
                        // label: 'Nome do Orçamento',
                        label: S.of(context).nomeBudget,
                        onSaved: (value) => budgetName = value!,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            // return 'Por favor, insira o nome do orçamento';
                            return S.of(context).mensagemErroNomeBudget;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 12),

                      // Campo para o Valor Máximo
                      _buildTextField(
                        textInputAction: TextInputAction.done,
                        // label: 'Valor Máximo',
                        label: S.of(context).valorMaximo,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        onSaved: (value) => maxValue = double.parse(value!),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            // return 'Por favor, insira o valor máximo';
                            return S.of(context).mensagemErroValorVazioBudget;
                          }
                          if (double.tryParse(value) == null) {
                            // return 'Por favor, insira um valor válido';
                            S.of(context).mensagemErroValorInvalidoBudget;
                          }
                          double valueDouble = double.parse(value);
                          if (valueDouble <= 0) {
                            // return 'Por favor, insira um valor válido';
                            return S
                                .of(context)
                                .mensagemErroValorInvalidoBudget;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 12),

                      // Botão para selecionar data
                      ElevatedButton.icon(
                        onPressed: () async {
                          DateTime? selectedDate = await showDatePicker(
                            context: context,
                            initialDate: endDate,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                          );
                          if (selectedDate != null) {
                            setState(() {
                              endDate = selectedDate;
                            });
                          }
                        },
                        icon: Icon(Icons.calendar_today),
                        // label: Text('Selecionar Data'),
                        label: Text(S.of(context).selecionarData),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),

                      // Exibir Data Selecionada
                      Text(
                        // 'Data de Encerramento: ${DateFormat('dd/MM/yyyy').format(endDate)}',
                        '${S.of(context).dataEncerramento}: ${DateFormat('dd/MM/yyyy').format(endDate)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16),

                // Botões de Ação
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        // 'Cancelar',
                        S.of(context).cancelar,
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          await widget.budgetService.createBudget(
                            budgetName,
                            maxValue,
                            endDate,
                          );
                          widget.onAddItem(
                            Budget(
                              id: Uuid().v4(),
                              name: budgetName,
                              expenses: [],
                              maxValue: maxValue,
                              endDate: endDate,
                              isNegative: false,
                            ),
                          );
                          if (context.mounted) {
                            Navigator.of(context).pop();
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Text(S.of(context).salvar),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método para criar um campo de texto reutilizável
  Widget _buildTextField({
    required String label,
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
    required Function(String?) onSaved,
    required String? Function(String?) validator,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 5,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: TextFormField(
          textInputAction: textInputAction,
          decoration: InputDecoration(
            labelText: label,
            border: InputBorder.none,
          ),
          keyboardType: keyboardType,
          onSaved: onSaved,
          validator: validator,
        ),
      ),
    );
  }
}
