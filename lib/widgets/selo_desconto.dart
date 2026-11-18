import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Selo laranja com o percentual de desconto do lote (ex.: "-60%").
class SeloDesconto extends StatelessWidget {
  final int percentual;

  const SeloDesconto({super.key, required this.percentual});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        '-$percentual%',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
