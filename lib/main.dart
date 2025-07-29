import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fin/model/budget_service.dart';
import 'package:fin/model/expense.dart';
import 'package:fin/model/budget.dart';
import 'package:flutter/material.dart';
import 'package:fin/home.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

final ThemeData coffeeCreamTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF6F4E37), // Marrom Café
    onPrimary: Colors.white,
    secondary: Color(0xFFC0A080), // Creme
    onSecondary: Colors.black,
    surface: Color(0xFFDCC7B0), // Creme médio
    onSurface: Colors.black,
    error: Colors.redAccent,
    onError: Colors.white,
  ),
  scaffoldBackgroundColor: Color(0xFFF3E5D8),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Color(0xFF6D4C41), // Marrom Café
    circularTrackColor: Color(0xFFD7CCC8), // Creme
    linearTrackColor: Color(0xFFBCAAA4), // Bege claro
    refreshBackgroundColor: Color(
      0xFFEFEBE9,
    ), // Fundo mais claro para carregamento
  ),
  dialogTheme: DialogTheme(
    backgroundColor: Color(0xFFF3E5D8), // Fundo claro com o tom de creme
    titleTextStyle: GoogleFonts.roboto(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Color(0xFF6F4E37), // Cor do título em marrom café
    ),
    contentTextStyle: GoogleFonts.nunito(
      fontSize: 16,
      color: Color(0xFF4E342E), // Cor do conteúdo em marrom médio
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
      side: BorderSide(
        color: Color(0xFF6F4E37),
        width: 1,
      ), // Bordas em marrom café
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF6F4E37),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  textTheme: TextTheme(
    headlineLarge: GoogleFonts.playfairDisplay(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: Color(0xFF3E2723),
    ),
    titleLarge: GoogleFonts.roboto(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: Color(0xFF5D4037),
    ),
    bodyLarge: GoogleFonts.nunito(fontSize: 16, color: Color(0xFF4E342E)),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF6F4E37),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFFDCC7B0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Color(0xFF6F4E37)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Color(0xFF6F4E37), width: 2),
    ),
  ),
);

final BudgetService budgetService = BudgetService();

Future<void> initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(ExpenseAdapter());
  Hive.registerAdapter(BudgetAdapter());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: AppLocalizationDelegate().supportedLocales,
      // supportedLocales: [
      //   Locale('pt', ''),
      //   Locale('en', ''),
      //   Locale('es', ''),
      //   Locale('fr', '')
      // ],
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // locale: Locale('pt'),
      theme: coffeeCreamTheme,
      home: FutureBuilder<void>(
        future: initHive(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(
                child: AutoSizeText(
                  // 'Algo deu errado ao iniciar o app\nTente fechar e abrir novamente!',
                  S.of(context).mensagemErroMain,
                  style: TextStyle(fontSize: 20),
                  minFontSize: 15,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          }
          return Home();
        },
      ),
    );
  }
}
