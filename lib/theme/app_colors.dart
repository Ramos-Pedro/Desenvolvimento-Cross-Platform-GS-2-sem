import 'package:flutter/material.dart';

/// Paleta do Segunda Mesa: o verde representa o alimento salvo e
/// o laranja destaca os descontos e o horário-limite de retirada.
abstract final class AppColors {
  // Cores da marca
  static const primary = Color(0xFF2E7D32);
  static const primaryDark = Color(0xFF1B5E20);
  static const primaryLight = Color(0xFF43A047);
  static const primaryContainer = Color(0xFFDCEFD9);
  static const onPrimaryContainer = Color(0xFF0B3D10);
  static const secondary = Color(0xFFEF6C00);
  static const secondaryContainer = Color(0xFFFFE0B2);
  static const onSecondaryContainer = Color(0xFF4A2300);

  // Tema claro
  static const lightBackground = Color(0xFFFAFAF5);
  static const lightSurface = Colors.white;
  static const lightText = Color(0xFF1C2B1F);
  static const lightSecondaryText = Color(0xFF5B6B5E);
  static const lightBorder = Color(0xFFE3E8DF);

  // Tema escuro
  static const darkPrimary = Color(0xFF81C784);
  static const darkOnPrimary = Color(0xFF0B3D10);
  static const darkPrimaryContainer = Color(0xFF1E4D24);
  static const darkOnPrimaryContainer = Color(0xFFC8E6C9);
  static const darkSecondary = Color(0xFFFFB74D);
  static const darkSecondaryContainer = Color(0xFF5C3300);
  static const darkOnSecondaryContainer = Color(0xFFFFE0B2);
  static const darkBackground = Color(0xFF0F1511);
  static const darkSurface = Color(0xFF18211B);
  static const darkText = Color(0xFFE6EFE7);
  static const darkSecondaryText = Color(0xFFA7B6AA);
  static const darkBorder = Color(0xFF2C3A2F);
}
