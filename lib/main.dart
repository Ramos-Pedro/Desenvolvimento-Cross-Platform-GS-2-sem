import 'dart:ui' show PointerDeviceKind;

import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() => runApp(const SegundaMesaApp());

class SegundaMesaApp extends StatelessWidget {
  const SegundaMesaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Segunda Mesa',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      // Segue automaticamente o tema (claro/escuro) configurado no dispositivo.
      themeMode: ThemeMode.system,
      // Permite arrastar as listas horizontais com o mouse ao rodar no Chrome.
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.trackpad,
        },
      ),
      home: const HomeScreen(),
    );
  }
}
