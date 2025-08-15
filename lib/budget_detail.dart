import 'package:fin/generated/l10n.dart';
import 'package:fin/main.dart';
import 'package:fin/model/budget.dart';
import 'package:fin/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'dart:ui' as ui;

class BudgetDetailsPage extends StatefulWidget {
  final Budget budget;
  final ValueNotifier<int> update;

  const BudgetDetailsPage({super.key, required this.budget, required this.update});

  @override
  _BudgetDetailsPageState createState() => _BudgetDetailsPageState();
}

class _BudgetDetailsPageState extends State<BudgetDetailsPage> {
  List<Expense> expenses = [];

  @override
  void initState() {
    super.initState();
    expenses = widget.budget.expenses;
  }

  void _addExpense() {
    final formKey = GlobalKey<FormState>();
    late String expenseName;
    late double expenseValue;

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  // 'Adicionar Gasto',
                  S.of(context).adicionarGasto,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 16),

                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      _buildTextField(
                        textInputAction: TextInputAction.next,
                        // label: 'Nome do Gasto',
                        label: S.of(context).nomeGasto,
                        onSaved: (value) => expenseName = value!,
                        validator:
                            (value) =>
                                value == null || value.trim().isEmpty
                                    // ? 'Por favor, insira um nome'
                                    ? S.of(context).mensagemErroNomeGasto
                                    : null,
                      ),
                      const SizedBox(height: 12),
                      _buildTextField(
                        // label: 'Valor',
                        label: S.of(context).valorGasto,
                        textInputAction: TextInputAction.done,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        onSaved: (value) => expenseValue = double.parse(value!),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            // return 'Insira um valor válido';
                            return S
                                .of(context)
                                .mensagemErroValorInvalidoBudget;
                          }
                          final valueDouble = double.tryParse(value);
                          if (valueDouble == null || valueDouble <= 0) {
                            // return 'O valor precisa ser maior que zero';
                            return S
                                .of(context)
                                .mensagemErroValorInvalidoBudget;
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          var ex = Expense(
                            id: Uuid().v4(),
                            name: expenseName,
                            value: expenseValue,
                          );
                          await budgetService.addExpense(widget.budget.id, ex);
                          if (context.mounted) {
                            Navigator.of(context).pop();
                          }
                          widget.update.value += 1;
                          setState(() {});
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: Text(S.of(context).salvar),
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

  @override
  Widget build(BuildContext context) {

    Locale locale = Localizations.localeOf(context);
    var format = NumberFormat.simpleCurrency(locale: locale.toString());

    return Scaffold(
      appBar: AppBar(title: Text(widget.budget.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // "Valor Máximo: \$${widget.budget.maxValue.toStringAsFixed(2)}",
              "${S.of(context).valorMaximo}: ${format.currencySymbol} ${widget.budget.maxValue.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Text(
            //   "${S.of(context).gastos}:",
            //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            // ),
            Expanded(
              child: CustomPaint(
                painter: LabelBorderPainter(label: S.of(context).gastos),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    itemCount: expenses.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 3,
                        child: ListTile(
                          title: Text(expenses[index].name),
                          subtitle: Text(
                            "${format.currencySymbol} ${expenses[index].value.toStringAsFixed(2)}",
                          ),
                          leading: const Icon(Icons.money, color: Colors.green),
                          trailing: IconButton(
                            icon: Icon(Icons.cancel_outlined, color: Colors.red),
                            onPressed: () async {
                              await budgetService.removeExpense(
                                widget.budget.id,
                                expenses[index].id,
                              );
                              widget.update.value -= 1;
                              setState(() {
                                expenses.removeWhere(
                                  (item) => item.id == expenses[index].id,
                                );
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addExpense,
        tooltip: "Adicionar Gasto",
        // tooltip: S.of(context).adicionarGasto,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class LabelBorderPainter extends CustomPainter {
  final String label;
  final Color borderColor;
  final double borderRadius;

  LabelBorderPainter({
    required this.label,
    this.borderColor = const Color(0xFFBDBDBD),
    this.borderRadius = 12.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8;

    const labelPaddingH = 8.0;
    const labelPaddingV = 4.0;

    final textPainter = TextPainter(
      text: TextSpan(
        text: label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      textDirection: ui.TextDirection.ltr,
    );
    textPainter.layout();

    final textWidth = textPainter.width + labelPaddingH * 2;
    final textHeight = textPainter.height + labelPaddingV * 2;

    final path = Path();

    // Começa no canto superior esquerdo (depois do texto)
    path.moveTo(textWidth, 0);
    path.lineTo(size.width - borderRadius, 0);
    path.arcToPoint(
      Offset(size.width, borderRadius),
      radius: Radius.circular(borderRadius),
    );
    path.lineTo(size.width, size.height - borderRadius);
    path.arcToPoint(
      Offset(size.width - borderRadius, size.height),
      radius: Radius.circular(borderRadius),
    );
    path.lineTo(borderRadius, size.height);
    path.arcToPoint(
      Offset(0, size.height - borderRadius),
      radius: Radius.circular(borderRadius),
    );
    path.lineTo(0, borderRadius);
    path.arcToPoint(
      Offset(borderRadius, 0),
      radius: Radius.circular(borderRadius),
    );

    // desenha a borda
    canvas.drawPath(path, paint);

    // // desenha o texto sem caixa
    // textPainter.paint(
    //   canvas,
    //   Offset(labelPaddingH, -(textPainter.height / 2) + 8),
    // );

    // 📌 Ajuste do texto centralizado e um pouco à direita
    final dx = labelPaddingH + 4; // move o texto para direita
    final dy = -textHeight / 2 + textPainter.height / 2; // centraliza vertical
    textPainter.paint(canvas, Offset(dx, dy));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


// class LabelBorderPainter extends CustomPainter {
//   final String label;
//   LabelBorderPainter({required this.label});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.black
//       ..style = PaintingStyle.stroke;

//     final radius = 10.0;
//     const labelPadding = 8.0;

//     // Desenha o retângulo com cantos arredondados
//     final rrect = RRect.fromRectAndRadius(
//       Rect.fromLTWH(0, 0, size.width, size.height),
//       Radius.circular(radius),
//     );

//     // Cria um Path com "recorte" no topo para o texto
//     final path = Path()..addRRect(rrect);
//     final textPainter = TextPainter(
//       text: TextSpan(
//         text: label,
//         style: const TextStyle(fontSize: 16, color: Colors.black),
//       ),
//       textDirection: ui.TextDirection.ltr,
//     );
//     textPainter.layout();

//     // Mede e cria o espaço
//     final textWidth = textPainter.width + labelPadding * 2;
//     final cutPath = Path()
//       ..addRect(Rect.fromLTWH(
//         (size.width - textWidth) / 2,
//         -1, // ligeiramente para cima para esconder a borda
//         textWidth,
//         textPainter.height,
//       ));

//     // Remove a parte da borda para o texto
//     final finalPath = Path.combine(PathOperation.difference, path, cutPath);

//     // Desenha
//     canvas.drawPath(finalPath, paint);

//     // Desenha o texto por cima
//     textPainter.paint(
//       canvas,
//       Offset((size.width - textWidth) / 2 + labelPadding,
//           -(textPainter.height / 2) + 8),
//     );
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }


Widget _buildTextField({
  required String label,
  TextInputAction? textInputAction,
  TextInputType? keyboardType,
  required Function(String?) onSaved,
  required String? Function(String?) validator,
}) {
  return TextFormField(
    textInputAction: textInputAction,
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
    keyboardType: keyboardType,
    onSaved: onSaved,
    validator: validator,
  );
}
