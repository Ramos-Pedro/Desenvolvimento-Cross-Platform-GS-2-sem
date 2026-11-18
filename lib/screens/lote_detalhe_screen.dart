import 'package:flutter/material.dart';

import '../models/lote.dart';
import '../utils/formatadores.dart';
import '../widgets/categoria_chip.dart';
import '../widgets/etiqueta_horario.dart';
import '../widgets/info_bloco.dart';
import '../widgets/info_item.dart';
import '../widgets/lote_imagem.dart';
import '../widgets/preco_lote.dart';
import '../widgets/selo_desconto.dart';
import '../widgets/seletor_quantidade.dart';

/// Detalhes de um lote, com a escolha da quantidade e a reserva.
/// Ao confirmar, a tela fecha devolvendo a quantidade: Navigator.pop(context, quantidade).
class LoteDetalheScreen extends StatefulWidget {
  final Lote lote;

  const LoteDetalheScreen({super.key, required this.lote});

  @override
  State<LoteDetalheScreen> createState() => _LoteDetalheScreenState();
}

class _LoteDetalheScreenState extends State<LoteDetalheScreen> {
  int _quantidade = 1;

  void _diminuirQuantidade() {
    setState(() {
      _quantidade--;
    });
  }

  void _aumentarQuantidade() {
    setState(() {
      _quantidade++;
    });
  }

  Future<void> _confirmarReserva() async {
    final lote = widget.lote;
    final total = lote.precoSegundaMesa * _quantidade;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar reserva'),
        content: Text(
          'Reservar ${formatarPorcoes(_quantidade)} de "${lote.nome}" '
          'por ${formatarPreco(total)}?\n\n'
          'Retirada até ${lote.horarioLimite} em ${lote.estabelecimento}.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;
    if (!mounted) return;

    // Volta para a tela inicial informando quantas porções foram reservadas.
    Navigator.pop(context, _quantidade);
  }

  @override
  Widget build(BuildContext context) {
    final lote = widget.lote;
    final cores = Theme.of(context).colorScheme;
    final total = lote.precoSegundaMesa * _quantidade;
    final economia = (lote.precoOriginal - lote.precoSegundaMesa) * _quantidade;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do lote')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Stack(
            children: [
              LoteImagem(
                caminho: lote.imagem,
                largura: double.infinity,
                altura: 220,
                borderRadius: BorderRadius.circular(24),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: SeloDesconto(percentual: lote.percentualDesconto),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: EtiquetaHorario(horario: lote.horarioLimite),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final categoria in lote.categorias)
                CategoriaChip(rotulo: categoria.rotulo, icone: categoria.icone),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            lote.nome,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 4),
          InfoItem(icone: Icons.storefront, texto: lote.estabelecimento),
          const SizedBox(height: 16),
          Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            color: cores.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: cores.outlineVariant),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: InfoBloco(
                      icone: Icons.place,
                      rotulo: 'Bairro',
                      valor: lote.bairro,
                    ),
                  ),
                  Expanded(
                    child: InfoBloco(
                      icone: Icons.schedule,
                      rotulo: 'Retirar até',
                      valor: lote.horarioLimite,
                    ),
                  ),
                  Expanded(
                    child: InfoBloco(
                      icone: Icons.inventory_2,
                      rotulo: 'Disponível',
                      valor: lote.esgotado
                          ? 'Esgotado'
                          : formatarPorcoes(lote.porcoes),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Sobre o lote',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 6),
          Text(
            lote.descricao,
            style: TextStyle(fontSize: 16, color: cores.onSurfaceVariant),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: cores.primaryContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Icon(Icons.eco, color: cores.onPrimaryContainer),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Cada porção resgatada evita o desperdício de '
                    '${formatarPeso(lote.pesoPorcaoKg)} de alimentos.',
                    style: TextStyle(
                      color: cores.onPrimaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            color: cores.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: cores.outlineVariant),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Preço por porção',
                    style: TextStyle(color: cores.onSurfaceVariant),
                  ),
                  const SizedBox(height: 4),
                  PrecoLote(
                    precoAtual: lote.precoSegundaMesa,
                    precoOriginal: lote.precoOriginal,
                    grande: true,
                  ),
                  if (!lote.esgotado) ...[
                    const Divider(height: 28),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Quantidade',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SeletorQuantidade(
                          quantidade: _quantidade,
                          onDiminuir:
                              _quantidade > 1 ? _diminuirQuantidade : null,
                          onAumentar: _quantidade < lote.porcoes
                              ? _aumentarQuantidade
                              : null,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Expanded(
                          child: Text('Total', style: TextStyle(fontSize: 16)),
                        ),
                        Text(
                          formatarPreco(total),
                          style: TextStyle(
                            color: cores.primary,
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Você economiza ${formatarPreco(economia)}',
                      style: TextStyle(
                        color: cores.secondary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 54,
            child: FilledButton.icon(
              onPressed: lote.esgotado ? null : _confirmarReserva,
              icon: const Icon(Icons.shopping_bag_outlined),
              label: Text(
                lote.esgotado
                    ? 'Lote esgotado'
                    : 'Reservar · ${formatarPreco(total)}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
