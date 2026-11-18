import 'package:flutter/material.dart';

import '../models/lote.dart';
import '../utils/formatadores.dart';
import 'info_item.dart';
import 'lote_imagem.dart';
import 'preco_lote.dart';
import 'selo_desconto.dart';

/// Item da lista vertical principal: apresenta um lote de alimentos.
class LoteCard extends StatelessWidget {
  final Lote lote;
  final VoidCallback? onTap;

  const LoteCard({super.key, required this.lote, this.onTap});

  @override
  Widget build(BuildContext context) {
    final cores = Theme.of(context).colorScheme;

    return Card(
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
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  LoteImagem(
                    caminho: lote.imagem,
                    largura: 96,
                    altura: 96,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  Positioned(
                    left: 6,
                    top: 6,
                    child: SeloDesconto(percentual: lote.percentualDesconto),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lote.rotulosCategorias.toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: cores.primary,
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      lote.nome,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      lote.estabelecimento,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: cores.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 12,
                      runSpacing: 4,
                      children: [
                        InfoItem(icone: Icons.place, texto: lote.bairro),
                        InfoItem(
                          icone: Icons.schedule,
                          texto: 'até ${lote.horarioLimite}',
                          cor: cores.secondary,
                        ),
                        InfoItem(
                          icone: Icons.inventory_2,
                          texto: lote.esgotado
                              ? 'Esgotado'
                              : formatarPorcoes(lote.porcoes),
                        ),
                      ],
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
