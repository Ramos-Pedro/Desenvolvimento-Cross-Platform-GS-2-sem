import 'package:flutter/material.dart';

import '../utils/formatadores.dart';

/// Preço do Segunda Mesa em destaque, seguido do preço original riscado.
class PrecoLote extends StatelessWidget {
  final double precoAtual;
  final double precoOriginal;

  /// Usa uma fonte maior (tela de detalhes).
  final bool grande;

  const PrecoLote({
    super.key,
    required this.precoAtual,
    required this.precoOriginal,
    this.grande = false,
  });

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          formatarPreco(precoAtual),
          style: TextStyle(
            color: cores.primary,
            fontSize: grande ? 26 : 17,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            formatarPreco(precoOriginal),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: cores.onSurfaceVariant,
              fontSize: 12,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ),
      ],
    );
  }
}
