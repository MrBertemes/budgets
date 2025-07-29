// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "adicionarBudget":
            MessageLookupByLibrary.simpleMessage("Ajouter un Nouveau Budget"),
        "apenasAtivos":
            MessageLookupByLibrary.simpleMessage("Actifs Seulement"),
        "cancelar": MessageLookupByLibrary.simpleMessage("Annuler"),
        "dataEncerramento":
            MessageLookupByLibrary.simpleMessage("Date de Clôture"),
        "excluir": MessageLookupByLibrary.simpleMessage("Supprimer"),
        "gastos": MessageLookupByLibrary.simpleMessage("Dépenses"),
        "mensagemConfirmacaoExlcusao": MessageLookupByLibrary.simpleMessage(
            "Êtes-vous sûr de vouloir supprimer ce budget ?"),
        "mensagemErroAllBudgets": MessageLookupByLibrary.simpleMessage(
            "Une erreur est survenue lors de la récupération des budgets\nEssayez de fermer et de rouvrir l\'application !"),
        "mensagemErroMain": MessageLookupByLibrary.simpleMessage(
            "\'Une erreur est survenue lors du démarrage de l\'application\nEssayez de fermer et de rouvrir l\'application !\'"),
        "mensagemErroNomeBudget": MessageLookupByLibrary.simpleMessage(
            "Veuillez entrer le nom du budget"),
        "mensagemErroValorInvalidoBudget": MessageLookupByLibrary.simpleMessage(
            "Veuillez entrer une valeur valide"),
        "mensagemErroValorVazioBudget": MessageLookupByLibrary.simpleMessage(
            "Veuillez entrer la valeur maximale"),
        "mensagemSemBudgetAtivo":
            MessageLookupByLibrary.simpleMessage("Aucun budget actif !"),
        "mensagemSemBudgetCadastrado":
            MessageLookupByLibrary.simpleMessage("Aucun budget enregistré !"),
        "nomeBudget": MessageLookupByLibrary.simpleMessage("Nom du Budget"),
        "salvar": MessageLookupByLibrary.simpleMessage("Sauvegarder"),
        "selecionarData":
            MessageLookupByLibrary.simpleMessage("Sélectionner la Date"),
        "valorMaximo": MessageLookupByLibrary.simpleMessage("Valeur Maximale")
      };
}
