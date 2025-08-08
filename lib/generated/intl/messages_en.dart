// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "adicionarBudget":
            MessageLookupByLibrary.simpleMessage("Add New Budget"),
        "adicionarGasto": MessageLookupByLibrary.simpleMessage("Add Expense"),
        "apenasAtivos": MessageLookupByLibrary.simpleMessage("Active Only"),
        "cancelar": MessageLookupByLibrary.simpleMessage("Cancel"),
        "dataEncerramento": MessageLookupByLibrary.simpleMessage("End Date"),
        "excluir": MessageLookupByLibrary.simpleMessage("Delete"),
        "gastos": MessageLookupByLibrary.simpleMessage("Expenses"),
        "mensagemConfirmacaoExlcusao": MessageLookupByLibrary.simpleMessage(
            "Are you sure you want to delete this budget?"),
        "mensagemErroAllBudgets": MessageLookupByLibrary.simpleMessage(
            "Something went wrong while fetching the budgets\nPlease try closing and reopening it!"),
        "mensagemErroMain": MessageLookupByLibrary.simpleMessage(
            "\'Something went wrong when starting the app\nPlease try closing and reopening it!\'"),
        "mensagemErroNomeBudget": MessageLookupByLibrary.simpleMessage(
            "Please, enter the budget name"),
        "mensagemErroNomeGasto":
            MessageLookupByLibrary.simpleMessage("Please, enter a name"),
        "mensagemErroValorInvalidoBudget":
            MessageLookupByLibrary.simpleMessage("Please, enter a valid value"),
        "mensagemErroValorVazioBudget": MessageLookupByLibrary.simpleMessage(
            "Please, enter the maximum value"),
        "mensagemSemBudgetAtivo":
            MessageLookupByLibrary.simpleMessage("No active budgets!"),
        "mensagemSemBudgetCadastrado":
            MessageLookupByLibrary.simpleMessage("No budgets registered!"),
        "nomeBudget": MessageLookupByLibrary.simpleMessage("Budget Name"),
        "nomeGasto": MessageLookupByLibrary.simpleMessage("Expense\'s name"),
        "salvar": MessageLookupByLibrary.simpleMessage("Save"),
        "selecionarData": MessageLookupByLibrary.simpleMessage("Select Date"),
        "valorGasto": MessageLookupByLibrary.simpleMessage("Expense\'s value"),
        "valorMaximo": MessageLookupByLibrary.simpleMessage("Maximum Value")
      };
}
