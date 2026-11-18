import 'package:flutter/material.dart';

import '../models/lote.dart';
import 'etiqueta_horario.dart';
import 'lote_imagem.dart';
import 'preco_lote.dart';
import 'selo_desconto.dart';

/// Item da lista horizontal de destaques.
class DestaqueCard extends StatelessWidget {
  final Lote lote;
  final VoidCallback? onTap;

  const DestaqueCard({super.key, required this.lote, this.onTap});

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return SizedBox(
      width: 248,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        color: cores.surface,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: cores.outlineVariant),
        ),
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  LoteImagem(caminho: lote.imagem, largura: 248, altura: 136),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: SeloDesconto(percentual: lote.percentualDesconto),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: EtiquetaHorario(horario: lote.horarioLimite),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lote.nome,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      '${lote.estabelecimento} · ${lote.bairro}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: cores.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 8),
                    PrecoLote(
                      precoAtual: lote.precoSegundaMesa,
                      precoOriginal: lote.precoOriginal,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
