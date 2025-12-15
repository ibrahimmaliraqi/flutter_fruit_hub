import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hub/core/services/shared_prefs.dart';
import 'package:fruit_hub/core/utils/helper_functions/on_generate_route.dart';
import 'package:fruit_hub/feaatures/auth/data/cubit/sign_in_with_email/sign_in_with_email_cubit.dart';
import 'package:fruit_hub/feaatures/auth/data/cubit/sign_up_with_email/sign_up_with_email_cubit.dart';
import 'package:fruit_hub/feaatures/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_hub/feaatures/splash/presentation/views/splash_view.dart';
import 'package:fruit_hub/firebase_options.dart';
import 'package:fruit_hub/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FruitsApp());
}

class FruitsApp extends StatelessWidget {
  const FruitsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) =>
              SignUpWithEmailCubit(AuthRepoImpl()),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              SignInWithEmailCubit(AuthRepoImpl()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Cairo',
          scaffoldBackgroundColor: Colors.white,
          splashColor: Colors.transparent,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
          ),
        ),
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
      ),
    );
  }
}
