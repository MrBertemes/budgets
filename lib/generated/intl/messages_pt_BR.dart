// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt_BR locale. All the
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
  String get localeName => 'pt_BR';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "adicionarBudget":
            MessageLookupByLibrary.simpleMessage("Adicionar Novo Orçamento"),
        "apenasAtivos": MessageLookupByLibrary.simpleMessage("Apenas Ativos"),
        "cancelar": MessageLookupByLibrary.simpleMessage("Cancelar"),
        "dataEncerramento":
            MessageLookupByLibrary.simpleMessage("Data de Encerramento"),
        "excluir": MessageLookupByLibrary.simpleMessage("Excluir"),
        "gastos": MessageLookupByLibrary.simpleMessage("Gastos"),
        "mensagemConfirmacaoExlcusao": MessageLookupByLibrary.simpleMessage(
            "Você tem certeza que deseja excluir este budget?"),
        "mensagemErroAllBudgets": MessageLookupByLibrary.simpleMessage(
            "Algo deu errado ao buscar pelos budgets\nTente fechar e abrir novamente!"),
        "mensagemErroMain": MessageLookupByLibrary.simpleMessage(
            "\'Algo deu errado ao iniciar o app\nTente fechar e abrir novamente!\'"),
        "mensagemErroNomeBudget": MessageLookupByLibrary.simpleMessage(
            "Por favor, insira o nome do orçamento"),
        "mensagemErroValorInvalidoBudget": MessageLookupByLibrary.simpleMessage(
            "Por favor, insira um valor válido"),
        "mensagemErroValorVazioBudget": MessageLookupByLibrary.simpleMessage(
            "Por favor, insira o valor máximo"),
        "mensagemSemBudgetAtivo":
            MessageLookupByLibrary.simpleMessage("Não há orçamentos ativos!"),
        "mensagemSemBudgetCadastrado": MessageLookupByLibrary.simpleMessage(
            "Não há orçamentos cadastrados!"),
        "nomeBudget": MessageLookupByLibrary.simpleMessage("Nome do Orçamento"),
        "salvar": MessageLookupByLibrary.simpleMessage("Salvar"),
        "selecionarData":
            MessageLookupByLibrary.simpleMessage("Selecionar Data"),
        "valorMaximo": MessageLookupByLibrary.simpleMessage("Valor Máximo")
      };
}
