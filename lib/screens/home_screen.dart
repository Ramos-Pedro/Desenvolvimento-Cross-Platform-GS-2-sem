import 'package:flutter/material.dart';

import '../models/categoria.dart';
import '../models/lote.dart';
import '../models/resumo_impacto.dart';
import '../repositories/lote_repository.dart';
import '../utils/formatadores.dart';
import '../widgets/categoria_selector.dart';
import '../widgets/destaques_section.dart';
import '../widgets/estado_vazio.dart';
import '../widgets/impacto_banner.dart';
import '../widgets/lote_card.dart';
import '../widgets/secao_titulo.dart';
import 'lote_detalhe_screen.dart';

/// Tela principal: banner de impacto, destaques, filtro por categoria
/// e a lista vertical com os lotes disponíveis.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LoteRepository _repository = LoteRepository();

  /// Categoria escolhida no filtro. null representa a opção "Todas".
  Categoria? _categoriaSelecionada;

  List<Lote> _lotes = [];
  List<Lote> _destaques = [];
  late ResumoImpacto _resumo;

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  /// Busca no repositório os dados exibidos na tela.
  /// Assim nenhuma regra de filtro fica dentro do método build.
  void _carregarDados() {
    _lotes = _repository.filtrarPorCategoria(_categoriaSelecionada);
    _destaques = _repository.listarDestaques();
    _resumo = _repository.gerarResumo();
  }

  void _selecionarCategoria(Categoria? categoria) {
    setState(() {
      _categoriaSelecionada = categoria;
      _lotes = _repository.filtrarPorCategoria(categoria);
    });
  }

  Future<void> _abrirDetalhe(Lote lote) async {
    // A tela de detalhes devolve a quantidade reservada (ou null se o usuário voltar).
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoteDetalheScreen(lote: lote)),
    );

    if (result == null) return;
    if (!mounted) return;

    setState(() {
      _repository.reservar(lote.id, result);
      _carregarDados();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Reserva de ${formatarPorcoes(result)} confirmada! '
          'Retire até ${lote.horarioLimite} em ${lote.estabelecimento}.',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:
                  Image.asset('assets/images/logo.png', width: 38, height: 38),
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Segunda Mesa',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'Zona Oeste · São Paulo',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 16, bottom: 32),
        // +1 porque o primeiro item é o cabeçalho (banner, destaques e categorias).
        itemCount: _lotes.length + 1,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildCabecalho();
          }

          final lote = _lotes[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LoteCard(lote: lote, onTap: () => _abrirDetalhe(lote)),
          );
        },
      ),
    );
  }

  Widget _buildCabecalho() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ImpactoBanner(resumo: _resumo),
        ),
        const SizedBox(height: 24),
        DestaquesSection(lotes: _destaques, onLoteSelecionado: _abrirDetalhe),
        const SizedBox(height: 24),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SecaoTitulo(
            titulo: 'Categorias',
            subtitulo: 'Filtre os lotes pelo tipo de alimento',
          ),
        ),
        const SizedBox(height: 12),
        CategoriaSelector(
          categorias: Categoria.values,
          categoriaSelecionada: _categoriaSelecionada,
          onCategoriaSelecionada: _selecionarCategoria,
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SecaoTitulo(
            titulo: 'Lotes disponíveis',
            subtitulo: _categoriaSelecionada?.rotulo ?? 'Todas as categorias',
            contador: _lotes.length,
          ),
        ),
        if (_lotes.isEmpty)
          EstadoVazio(
            mensagem: 'Nenhum lote nesta categoria no momento.',
            onVerTodos: () => _selecionarCategoria(null),
          ),
      ],
    );
  }
}
