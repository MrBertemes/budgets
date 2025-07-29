import 'package:auto_size_text/auto_size_text.dart';
import 'package:fin/generated/l10n.dart';
import 'package:flutter/material.dart';

class BudgetAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isActiveFilter;
  final Function(bool) onFilterChanged;

  const BudgetAppBar({
    super.key,
    required this.isActiveFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Budgets', style: TextStyle(fontWeight: FontWeight.bold)),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AutoSizeText(
                // 'Apenas Ativos',
                S.of(context).apenasAtivos,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                minFontSize: 10,
              ),
              SizedBox(width: 12),
              Switch(
                value: isActiveFilter,
                onChanged: (value) {
                  onFilterChanged(value); // Callback para alterar o filtro
                },
                activeColor: Color(0xFF3E2C1C), // Cor quando estiver ativado
                inactiveThumbColor: Color(
                  0xFFDCC7B0,
                ), // Cor da bolinha inativa
                inactiveTrackColor: Color(0xFF6F4E37), // Cor do track inativo
              ),
              SizedBox(width: 12),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // Tamanho padrão do AppBar
}
