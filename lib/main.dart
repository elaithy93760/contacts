import 'package:contact/core/theme/app_theme_manager.dart';
import 'package:contact/modules/pages/home.dart';
import 'package:contact/modules/pages/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Contacts());
}

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
      routes: {
        Splash.routeName: (context) => const Splash(),
        Home.routeName: (context) => const Home(),
      },
      initialRoute: Splash.routeName,
    );
  }
}
