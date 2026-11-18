import 'package:flutter/material.dart';

/// Bloco centralizado com ícone, rótulo e valor (usado na tela de detalhes).
class InfoBloco extends StatelessWidget {
  final IconData icone;
  final String rotulo;
  final String valor;

  const InfoBloco({
    super.key,
    required this.icone,
    required this.rotulo,
    required this.valor,
  });

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Column(
      children: [
        Icon(icone, color: cores.primary, size: 22),
        const SizedBox(height: 4),
        Text(
          rotulo,
          style: TextStyle(fontSize: 11, color: cores.onSurfaceVariant),
        ),
        Text(
          valor,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
