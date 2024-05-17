import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/app_export.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: "https://dkfcfptrfrwksqbyqqlo.supabase.co",
      anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRrZmNmcHRyZnJ3a3NxYnlxcWxvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTU3MDAzNzAsImV4cCI6MjAzMTI3NjM3MH0.swXCEi4lZ_1Iws8V802o3-cH-QHXnH59CR8UkKtNa08");

  runApp(MyApp());
}
  /*WidgetsFlutterBinding.ensureInitialized();
  try {
    print('Current working directory: ${Directory.current.path}');
    await dotenv.load(fileName: ".env");
    if (dotenv.env['DATABASE_URL']!= null && dotenv.env['API_KEY']!= null) {
      String url = dotenv.env['DATABASE_URL']!;
      String anonKey = dotenv.env['ANON_KEY']!;
      await Supabase.initialize(url: url, anonKey: anonKey);
    } else {
      print("Missing required environment variables.");
    }
    Future.wait([
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
      PrefUtils().init()
    ]).then((value) {
      runApp(MyApp());
    });
  } catch (e) {
    print("error loading environment variables: $e");
  }
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
          child: Consumer<ThemeProvider>(
            builder: (context, provider, child) {
              return MaterialApp(
                title: 'perim_app',
                debugShowCheckedModeBanner: false,
                theme: theme,
                navigatorKey: NavigatorService.navigatorKey,
                localizationsDelegates: [
                  AppLocalizationDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                supportedLocales: [Locale('en', '')],
                initialRoute: AppRoutes.initialRoute,
                routes: AppRoutes.routes,
              );
            },
          ),
        );
      },
    );
  }
}
