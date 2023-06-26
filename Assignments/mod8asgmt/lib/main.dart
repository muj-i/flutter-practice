import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'home copy 2.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themes: [
        AppTheme(
          data: ThemeData.light().copyWith(
            useMaterial3: true,
            colorScheme:
                ColorScheme.fromSeed(seedColor: Colors.indigo.shade900),
          ),
          id: 'custom_theme_light',
          description: 'Dark Theme',
        ),
        AppTheme(
          id: "custom_theme_dark",
          description: "Dark Theme",
          data: ThemeData.dark(
            useMaterial3: true,
          ),
        ),
      ],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            theme: ThemeProvider.themeOf(themeContext).data,
            title: 'Material App',
            home: HomeScreen(),
            // home: Material(
            //   child: Center(
            //     child: HomeScreen(),
            //   ),
            // ),
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }
}
