import 'package:flutter/material.dart';

/// Imagem de um lote carregada dos assets do app (Image.asset),
/// com bordas arredondadas e um ícone caso o arquivo não seja encontrado.
class LoteImagem extends StatelessWidget {
  final String caminho;
  final double largura;
  final double altura;
  final BorderRadius borderRadius;

  const LoteImagem({
    super.key,
    required this.caminho,
    required this.largura,
    required this.altura,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.asset(
        caminho,
        width: largura,
        height: altura,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: largura,
            height: altura,
            color: cores.primaryContainer,
            child: Icon(Icons.restaurant, color: cores.primary, size: 36),
          );
        },
      ),
    );
  }
}
