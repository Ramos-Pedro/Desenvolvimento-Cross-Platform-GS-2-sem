import 'categoria.dart';

/// Lote de alimentos excedentes disponibilizado por um comércio parceiro.
///
/// Os preços e o peso são por porção. Um lote pode pertencer a uma ou mais
/// categorias e o atributo [destaque] indica se ele aparece em "Destaques do dia".
class Lote {
  final int id;
  final String nome;
  final String estabelecimento;
  final String bairro;
  final String descricao;
  final String imagem;
  final double precoOriginal;
  final double precoSegundaMesa;
  final int porcoes;
  final double pesoPorcaoKg;
  final String horarioLimite;
  final List<Categoria> categorias;
  final bool destaque;

  const Lote({
    required this.id,
    required this.nome,
    required this.estabelecimento,
    required this.bairro,
    required this.descricao,
    required this.imagem,
    required this.precoOriginal,
    required this.precoSegundaMesa,
    required this.porcoes,
    required this.pesoPorcaoKg,
    required this.horarioLimite,
    required this.categorias,
    this.destaque = false,
  });

  /// Primeira categoria da lista, usada como ícone principal do lote.
  Categoria get categoriaPrincipal => categorias.first;

  /// Nomes das categorias separados por "·" (ex.: "Padaria · Refeições").
  String get rotulosCategorias =>
      categorias.map((categoria) => categoria.rotulo).join(' · ');

  /// Desconto em relação ao preço original, em porcentagem (ex.: 60).
  int get percentualDesconto =>
      ((1 - precoSegundaMesa / precoOriginal) * 100).round();

  /// Peso estimado de todas as porções ainda disponíveis.
  double get pesoDisponivelKg => porcoes * pesoPorcaoKg;

  /// Indica que todas as porções já foram reservadas.
  bool get esgotado => porcoes == 0;

  /// Cria uma cópia do lote alterando apenas a quantidade de porções.
  Lote copyWith({int? porcoes}) {
    return Lote(
      id: id,
      nome: nome,
      estabelecimento: estabelecimento,
      bairro: bairro,
      descricao: descricao,
      imagem: imagem,
      precoOriginal: precoOriginal,
      precoSegundaMesa: precoSegundaMesa,
      porcoes: porcoes ?? this.porcoes,
      pesoPorcaoKg: pesoPorcaoKg,
      horarioLimite: horarioLimite,
      categorias: categorias,
      destaque: destaque,
    );
  }
}
