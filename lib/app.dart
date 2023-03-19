import 'package:flutter/material.dart';
import 'package:todoinflutter/pages/home_page/home_page.dart';
import 'package:todoinflutter/pages/home_page/theme_controller.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ThemeController.instance,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.deepPurple,
              brightness: ThemeController.instance.isDarkThemeSelected
                  ? Brightness.dark
                  : Brightness.light),
          home: Scaffold(
              appBar: AppBar(
                title: const Text('Meu app'),
                centerTitle: true,
              ),
              body: const MyHomePage()),
        );
      },
    );
  }
}
