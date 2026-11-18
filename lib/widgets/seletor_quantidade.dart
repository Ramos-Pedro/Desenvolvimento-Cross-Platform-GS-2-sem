import 'package:flutter/material.dart';

/// Botões "-" e "+" para escolher quantas porções reservar.
/// Quando o callback é null, o botão fica desabilitado.
class SeletorQuantidade extends StatelessWidget {
  final int quantidade;
  final VoidCallback? onDiminuir;
  final VoidCallback? onAumentar;

  const SeletorQuantidade({
    super.key,
    required this.quantidade,
    this.onDiminuir,
    this.onAumentar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton.filledTonal(
          onPressed: onDiminuir,
          tooltip: 'Diminuir quantidade',
          icon: const Icon(Icons.remove),
        ),
        SizedBox(
          width: 40,
          child: Text(
            '$quantidade',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
        ),
        IconButton.filledTonal(
          onPressed: onAumentar,
          tooltip: 'Aumentar quantidade',
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
