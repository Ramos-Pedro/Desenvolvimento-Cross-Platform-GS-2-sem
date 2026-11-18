import 'package:flutter/material.dart';

/// Título padrão das seções da tela, com subtítulo e contador opcionais.
class SecaoTitulo extends StatelessWidget {
  final String titulo;
  final String? subtitulo;
  final int? contador;

  const SecaoTitulo({
    super.key,
    required this.titulo,
    this.subtitulo,
    this.contador,
  });

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                ),
              ),
              if (subtitulo != null)
                Text(
                  subtitulo!,
                  style: TextStyle(
                    fontSize: 14,
                    color: cores.onSurfaceVariant,
                  ),
                ),
            ],
          ),
        ),
        if (contador != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: cores.primaryContainer,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              '$contador',
              style: TextStyle(
                color: cores.onPrimaryContainer,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
      ],
    );
  }
}
