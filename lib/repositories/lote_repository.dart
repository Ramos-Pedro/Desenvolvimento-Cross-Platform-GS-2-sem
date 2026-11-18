import '../models/categoria.dart';
import '../models/lote.dart';
import '../models/resumo_impacto.dart';

/// Repositório em memória que centraliza os lotes usados pelo aplicativo.
/// As telas não criam dados nem aplicam filtros: elas só chamam os métodos abaixo.
class LoteRepository {
  final List<Lote> _lotes = [
    const Lote(
      id: 1,
      nome: 'Cesta de pães do dia',
      estabelecimento: 'Padaria Pão Quente',
      bairro: 'Pinheiros',
      descricao: 'Pães franceses, de forma e integrais assados hoje. '
          'Ótimos para o café da manhã ou para congelar.',
      imagem: 'assets/images/lote_paes.png',
      precoOriginal: 32.0,
      precoSegundaMesa: 12.9,
      porcoes: 8,
      pesoPorcaoKg: 0.5,
      horarioLimite: '20:00',
      categorias: [Categoria.padaria],
      destaque: true,
    ),
    const Lote(
      id: 2,
      nome: 'Marmitas executivas',
      estabelecimento: 'Restaurante Sabor Caseiro',
      bairro: 'Vila Madalena',
      descricao: 'Arroz, feijão, proteína do dia e salada, preparados no '
          'almoço e mantidos sob refrigeração.',
      imagem: 'assets/images/lote_marmitas.png',
      precoOriginal: 28.0,
      precoSegundaMesa: 11.0,
      porcoes: 15,
      pesoPorcaoKg: 0.5,
      horarioLimite: '15:30',
      categorias: [Categoria.refeicoes],
      destaque: true,
    ),
    const Lote(
      id: 3,
      nome: 'Caixa de frutas maduras',
      estabelecimento: 'Hortifruti Raiz',
      bairro: 'Lapa',
      descricao: 'Bananas, maçãs, laranjas, peras e uvas maduras, perfeitas '
          'para consumo imediato, sucos ou doces caseiros.',
      imagem: 'assets/images/lote_frutas.png',
      precoOriginal: 24.0,
      precoSegundaMesa: 9.5,
      porcoes: 10,
      pesoPorcaoKg: 2.0,
      horarioLimite: '19:00',
      categorias: [Categoria.hortifruti],
      destaque: true,
    ),
    const Lote(
      id: 4,
      nome: 'Bolos e tortas do dia',
      estabelecimento: 'Doceria Açúcar & Afeto',
      bairro: 'Perdizes',
      descricao: 'Bolos caseiros e tortas doces produzidos hoje. '
          'Mantenha refrigerado após a retirada.',
      imagem: 'assets/images/lote_bolos.png',
      precoOriginal: 45.0,
      precoSegundaMesa: 18.0,
      porcoes: 6,
      pesoPorcaoKg: 1.0,
      horarioLimite: '21:00',
      categorias: [Categoria.confeitaria, Categoria.padaria],
      destaque: true,
    ),
    const Lote(
      id: 5,
      nome: 'Kit mercearia próxima ao vencimento',
      estabelecimento: 'Mercadinho do Bairro',
      bairro: 'Butantã',
      descricao: 'Massas, enlatados, óleo e grãos dentro da validade, com '
          'vencimento nos próximos dias.',
      imagem: 'assets/images/lote_mercearia.png',
      precoOriginal: 40.0,
      precoSegundaMesa: 15.0,
      porcoes: 12,
      pesoPorcaoKg: 2.5,
      horarioLimite: '18:00',
      categorias: [Categoria.mercearia],
    ),
    const Lote(
      id: 6,
      nome: 'Sucos naturais do dia',
      estabelecimento: 'Empório Verde',
      bairro: 'Alto de Pinheiros',
      descricao: 'Sucos de laranja, verde e de frutas vermelhas prensados a '
          'frio pela manhã (garrafas de 500 ml).',
      imagem: 'assets/images/lote_sucos.png',
      precoOriginal: 20.0,
      precoSegundaMesa: 8.0,
      porcoes: 20,
      pesoPorcaoKg: 0.5,
      horarioLimite: '17:30',
      categorias: [Categoria.bebidas, Categoria.hortifruti],
    ),
    const Lote(
      id: 7,
      nome: 'Prato do dia com acompanhamentos',
      estabelecimento: 'Cantina Nonna Lia',
      bairro: 'Lapa',
      descricao: 'Espaguete ao sugo com almôndegas e manjericão, preparado '
          'para o jantar de hoje.',
      imagem: 'assets/images/lote_prato_do_dia.png',
      precoOriginal: 36.0,
      precoSegundaMesa: 14.0,
      porcoes: 9,
      pesoPorcaoKg: 0.5,
      horarioLimite: '22:00',
      categorias: [Categoria.refeicoes],
    ),
    const Lote(
      id: 8,
      nome: 'Salgados assados',
      estabelecimento: 'Padaria Pão Quente',
      bairro: 'Pinheiros',
      descricao: 'Caixa com coxinhas, esfihas e folhados assados no período '
          'da tarde.',
      imagem: 'assets/images/lote_salgados.png',
      precoOriginal: 22.0,
      precoSegundaMesa: 8.9,
      porcoes: 14,
      pesoPorcaoKg: 0.4,
      horarioLimite: '19:30',
      categorias: [Categoria.padaria, Categoria.refeicoes],
    ),
    const Lote(
      id: 9,
      nome: 'Iogurtes e laticínios',
      estabelecimento: 'Mercado Vila Verde',
      bairro: 'Vila Leopoldina',
      descricao: 'Leite fresco, iogurtes e queijo próximos da data de '
          'validade, armazenados sob refrigeração.',
      imagem: 'assets/images/lote_laticinios.png',
      precoOriginal: 30.0,
      precoSegundaMesa: 12.0,
      porcoes: 10,
      pesoPorcaoKg: 1.2,
      horarioLimite: '20:30',
      categorias: [Categoria.mercearia],
    ),
    const Lote(
      id: 10,
      nome: 'Café com pão de queijo',
      estabelecimento: 'Café da Praça',
      bairro: 'Perdizes',
      descricao: 'Combo com pães de queijo assados no dia e café coado '
          'para levar.',
      imagem: 'assets/images/lote_cafe.png',
      precoOriginal: 18.0,
      precoSegundaMesa: 7.5,
      porcoes: 12,
      pesoPorcaoKg: 0.3,
      horarioLimite: '18:30',
      categorias: [Categoria.padaria, Categoria.bebidas],
    ),
  ];

  int _porcoesResgatadas = 0;
  double _kgResgatados = 0;

  /// Retorna todos os lotes cadastrados.
  List<Lote> listarTodos() {
    return _lotes.toList();
  }

  /// Retorna os lotes de uma categoria. Categoria nula significa "Todas".
  /// Como um lote pode ter várias categorias, usamos contains.
  List<Lote> filtrarPorCategoria(Categoria? categoria) {
    if (categoria == null) return listarTodos();

    return _lotes.where((lote) => lote.categorias.contains(categoria)).toList();
  }

  /// Retorna somente os lotes marcados como destaque.
  List<Lote> listarDestaques() {
    return _lotes.where((lote) => lote.destaque).toList();
  }

  /// Busca um lote pelo id.
  Lote buscarPorId(int id) {
    return _lotes.firstWhere((lote) => lote.id == id);
  }

  /// Reserva porções de um lote, diminuindo a quantidade disponível.
  void reservar(int loteId, int quantidade) {
    final indice = _lotes.indexWhere((lote) => lote.id == loteId);
    if (indice == -1) return;

    final lote = _lotes[indice];
    if (quantidade < 1 || quantidade > lote.porcoes) return;

    _lotes[indice] = lote.copyWith(porcoes: lote.porcoes - quantidade);
    _porcoesResgatadas += quantidade;
    _kgResgatados += quantidade * lote.pesoPorcaoKg;
  }

  /// Soma os números exibidos no banner de impacto da tela inicial.
  ResumoImpacto gerarResumo() {
    var lotesDisponiveis = 0;
    var porcoes = 0;
    var kg = 0.0;

    for (final lote in _lotes) {
      if (!lote.esgotado) lotesDisponiveis++;
      porcoes += lote.porcoes;
      kg += lote.pesoDisponivelKg;
    }

    return ResumoImpacto(
      totalLotes: lotesDisponiveis,
      totalPorcoes: porcoes,
      totalKg: kg,
      porcoesResgatadas: _porcoesResgatadas,
      kgResgatados: _kgResgatados,
    );
  }
}
