import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitable_flat/provider/theme_provider.dart';
import 'package:suitable_flat/screens/home_screen.dart';

void main() => runApp(
  ChangeNotifierProvider(
  builder: (_) => ThemeProvider(isLightTheme: true),
  child: MyApp(),
),);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  ThemeMode themeMode=ThemeMode.light;
  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode, // Change it
      theme: themeProvider.getThemeData,// as you want

      home: HomePage(),
    );
  }


}

