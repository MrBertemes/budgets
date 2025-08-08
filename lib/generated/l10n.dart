// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `'Something went wrong when starting the app\nPlease try closing and reopening it!'`
  String get mensagemErroMain {
    return Intl.message(
      '\'Something went wrong when starting the app\nPlease try closing and reopening it!\'',
      name: 'mensagemErroMain',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong while fetching the budgets\nPlease try closing and reopening it!`
  String get mensagemErroAllBudgets {
    return Intl.message(
      'Something went wrong while fetching the budgets\nPlease try closing and reopening it!',
      name: 'mensagemErroAllBudgets',
      desc: '',
      args: [],
    );
  }

  /// `No budgets registered!`
  String get mensagemSemBudgetCadastrado {
    return Intl.message(
      'No budgets registered!',
      name: 'mensagemSemBudgetCadastrado',
      desc: '',
      args: [],
    );
  }

  /// `No active budgets!`
  String get mensagemSemBudgetAtivo {
    return Intl.message(
      'No active budgets!',
      name: 'mensagemSemBudgetAtivo',
      desc: '',
      args: [],
    );
  }

  /// `Expenses`
  String get gastos {
    return Intl.message(
      'Expenses',
      name: 'gastos',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this budget?`
  String get mensagemConfirmacaoExlcusao {
    return Intl.message(
      'Are you sure you want to delete this budget?',
      name: 'mensagemConfirmacaoExlcusao',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancelar {
    return Intl.message(
      'Cancel',
      name: 'cancelar',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get excluir {
    return Intl.message(
      'Delete',
      name: 'excluir',
      desc: '',
      args: [],
    );
  }

  /// `Add New Budget`
  String get adicionarBudget {
    return Intl.message(
      'Add New Budget',
      name: 'adicionarBudget',
      desc: '',
      args: [],
    );
  }

  /// `Budget Name`
  String get nomeBudget {
    return Intl.message(
      'Budget Name',
      name: 'nomeBudget',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter the budget name`
  String get mensagemErroNomeBudget {
    return Intl.message(
      'Please, enter the budget name',
      name: 'mensagemErroNomeBudget',
      desc: '',
      args: [],
    );
  }

  /// `Maximum Value`
  String get valorMaximo {
    return Intl.message(
      'Maximum Value',
      name: 'valorMaximo',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter the maximum value`
  String get mensagemErroValorVazioBudget {
    return Intl.message(
      'Please, enter the maximum value',
      name: 'mensagemErroValorVazioBudget',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter a valid value`
  String get mensagemErroValorInvalidoBudget {
    return Intl.message(
      'Please, enter a valid value',
      name: 'mensagemErroValorInvalidoBudget',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get selecionarData {
    return Intl.message(
      'Select Date',
      name: 'selecionarData',
      desc: '',
      args: [],
    );
  }

  /// `End Date`
  String get dataEncerramento {
    return Intl.message(
      'End Date',
      name: 'dataEncerramento',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get salvar {
    return Intl.message(
      'Save',
      name: 'salvar',
      desc: '',
      args: [],
    );
  }

  /// `Active Only`
  String get apenasAtivos {
    return Intl.message(
      'Active Only',
      name: 'apenasAtivos',
      desc: '',
      args: [],
    );
  }

  /// `Add Expense`
  String get adicionarGasto {
    return Intl.message(
      'Add Expense',
      name: 'adicionarGasto',
      desc: '',
      args: [],
    );
  }

  /// `Expense's name`
  String get nomeGasto {
    return Intl.message(
      'Expense\'s name',
      name: 'nomeGasto',
      desc: '',
      args: [],
    );
  }

  /// `Expense's value`
  String get valorGasto {
    return Intl.message(
      'Expense\'s value',
      name: 'valorGasto',
      desc: '',
      args: [],
    );
  }

  /// `Please, enter a name`
  String get mensagemErroNomeGasto {
    return Intl.message(
      'Please, enter a name',
      name: 'mensagemErroNomeGasto',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
