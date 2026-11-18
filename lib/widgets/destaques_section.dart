import 'package:flutter/material.dart';

import '../models/lote.dart';
import 'destaque_card.dart';
import 'secao_titulo.dart';

/// Seção "Destaques do dia": lista horizontal com os lotes em destaque.
class DestaquesSection extends StatelessWidget {
  final List<Lote> lotes;
  final ValueChanged<Lote> onLoteSelecionado;

  const DestaquesSection({
    super.key,
    required this.lotes,
    required this.onLoteSelecionado,
  });

  @override
  Widget build(BuildContext context) {
    if (lotes.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SecaoTitulo(
            titulo: 'Destaques do dia',
            subtitulo: 'Maiores descontos para retirar hoje',
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: lotes.length,
            itemBuilder: (context, index) {
              final lote = lotes[index];

              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: DestaqueCard(
                  lote: lote,
                  onTap: () => onLoteSelecionado(lote),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
