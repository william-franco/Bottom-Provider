import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bottom_provider/providers/bottom_nav_provider.dart';
import 'package:bottom_provider/providers/counter_provider.dart';
import 'package:bottom_provider/providers/list_provider.dart';
import 'package:bottom_provider/providers/theme_provider.dart';
import 'package:bottom_provider/routes/routes.dart';
import 'package:bottom_provider/themes/custom_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<BottomNavBarProvider>(
          create: (context) => BottomNavBarProvider(),
        ),
        ChangeNotifierProvider<CounterProvider>(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider<ListProvider>(
          create: (context) => ListProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Bottom Provider',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.getTheme,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      routes: Routes.routes,
      initialRoute: Routes.splash,
    );
  }
}
