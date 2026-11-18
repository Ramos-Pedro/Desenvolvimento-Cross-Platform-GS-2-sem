import 'package:flutter/material.dart';

/// Chip de categoria. Quando selecionado, fica preenchido com a cor principal.
/// É usado no filtro da tela inicial e também na tela de detalhes.
class CategoriaChip extends StatelessWidget {
  final String rotulo;
  final IconData icone;
  final bool selecionada;
  final VoidCallback? onTap;

  const CategoriaChip({
    super.key,
    required this.rotulo,
    required this.icone,
    this.selecionada = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Material(
      color: selecionada ? cores.primary : cores.surface,
      shape: StadiumBorder(
        side: BorderSide(
          color: selecionada ? cores.primary : cores.outlineVariant,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icone,
                size: 18,
                color: selecionada ? cores.onPrimary : cores.primary,
              ),
              const SizedBox(width: 6),
              Text(
                rotulo,
                style: TextStyle(
                  color: selecionada ? cores.onPrimary : cores.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
