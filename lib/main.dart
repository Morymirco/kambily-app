import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'views/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kambily',
      theme: ThemeData(
        fontFamily: 'Krub',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: 'Krub'),
          bodyMedium: TextStyle(fontFamily: 'Krub'),
          titleLarge: TextStyle(fontFamily: 'Krub'),
          titleMedium: TextStyle(fontFamily: 'Krub'),
          titleSmall: TextStyle(fontFamily: 'Krub'),
        ),
      ),
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
