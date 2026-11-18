import 'package:flutter/material.dart';

/// Informação curta acompanhada de um ícone (ex.: bairro, horário, porções).
class InfoItem extends StatelessWidget {
  final IconData icone;
  final String texto;

  /// Cor do ícone e do texto. Se for nula, usa as cores do tema.
  final Color? cor;

  const InfoItem({
    super.key,
    required this.icone,
    required this.texto,
    this.cor,
  });

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icone, size: 16, color: cor ?? cores.primary),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            texto,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: cor ?? cores.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
