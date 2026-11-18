import 'package:flutter/material.dart';

/// Etiqueta escura exibida sobre a imagem com o horário-limite de retirada.
class EtiquetaHorario extends StatelessWidget {
  final String horario;

  const EtiquetaHorario({super.key, required this.horario});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.schedule, size: 14, color: Colors.white),
          const SizedBox(width: 4),
          Text(
            'até $horario',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
