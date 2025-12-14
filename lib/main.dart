import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub/core/services/shared_prefs.dart';
import 'package:fruit_hub/core/utils/helper_functions/on_generate_route.dart';
import 'package:fruit_hub/feaatures/splash/presentation/views/splash_view.dart';
import 'package:fruit_hub/generated/l10n.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  await Supabase.initialize(
    url: 'https://acbggihxejiapkguvxxz.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFjYmdnaWh4ZWppYXBrZ3V2eHh6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjU0Njk4NzcsImV4cCI6MjA4MTA0NTg3N30.HS-GXONR2sFG2S-NCgJvNcSLWBBk2LKTGrjve7WjncA',
  );

  runApp(const FruitsApp());
}

final supabase = Supabase.instance.client;

class FruitsApp extends StatelessWidget {
  const FruitsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Cairo'),
      locale: Locale("ar"),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("ar"),
        Locale("en"),
      ],
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.id,
    );
  }
}
