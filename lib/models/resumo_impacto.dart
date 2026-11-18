/// Números de impacto exibidos no banner da tela inicial.
class ResumoImpacto {
  final int totalLotes;
  final int totalPorcoes;
  final double totalKg;
  final int porcoesResgatadas;
  final double kgResgatados;

  const ResumoImpacto({
    required this.totalLotes,
    required this.totalPorcoes,
    required this.totalKg,
    required this.porcoesResgatadas,
    required this.kgResgatados,
  });

  /// Indica se o usuário já reservou alguma porção nesta sessão.
  bool get possuiResgates => porcoesResgatadas > 0;
}
