// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "adicionarBudget":
            MessageLookupByLibrary.simpleMessage("Añadir Nuevo Presupuesto"),
        "apenasAtivos": MessageLookupByLibrary.simpleMessage("Solo Activos"),
        "cancelar": MessageLookupByLibrary.simpleMessage("Cancelar"),
        "dataEncerramento":
            MessageLookupByLibrary.simpleMessage("Fecha de Cierre"),
        "excluir": MessageLookupByLibrary.simpleMessage("Eliminar"),
        "gastos": MessageLookupByLibrary.simpleMessage("Gastos"),
        "mensagemConfirmacaoExlcusao": MessageLookupByLibrary.simpleMessage(
            "¿Estás seguro de que deseas eliminar este presupuesto?"),
        "mensagemErroAllBudgets": MessageLookupByLibrary.simpleMessage(
            "Algo salió mal al buscar los presupuestos\n¡Intenta cerrar y volver a abrirla!"),
        "mensagemErroMain": MessageLookupByLibrary.simpleMessage(
            "\'Algo salió mal al iniciar la aplicación\n¡Intenta cerrar y volver a abrirla!\'"),
        "mensagemErroNomeBudget": MessageLookupByLibrary.simpleMessage(
            "Por favor, ingresa el nombre del presupuesto"),
        "mensagemErroValorInvalidoBudget": MessageLookupByLibrary.simpleMessage(
            "Por favor, ingresa un valor válido"),
        "mensagemErroValorVazioBudget": MessageLookupByLibrary.simpleMessage(
            "Por favor, ingresa el valor máximo"),
        "mensagemSemBudgetAtivo": MessageLookupByLibrary.simpleMessage(
            "¡No hay presupuestos activos!"),
        "mensagemSemBudgetCadastrado": MessageLookupByLibrary.simpleMessage(
            "¡No hay presupuestos registrados!"),
        "nomeBudget":
            MessageLookupByLibrary.simpleMessage("Nombre del Presupuesto"),
        "salvar": MessageLookupByLibrary.simpleMessage("Guardar"),
        "selecionarData":
            MessageLookupByLibrary.simpleMessage("Seleccionar Fecha"),
        "valorMaximo": MessageLookupByLibrary.simpleMessage("Valor Máximo")
      };
}
