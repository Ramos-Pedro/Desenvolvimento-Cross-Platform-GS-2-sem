import 'package:flutter/material.dart';

import '../models/resumo_impacto.dart';
import '../theme/app_colors.dart';
import '../utils/formatadores.dart';

/// Banner da tela inicial com a proposta do app e os números de impacto.
class ImpactoBanner extends StatelessWidget {
  final ResumoImpacto resumo;

  const ImpactoBanner({super.key, required this.resumo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primaryLight, AppColors.primaryDark],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Comida boa ganha uma segunda mesa',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Excedentes de comércios da Zona Oeste de São Paulo '
                      'com retirada hoje e preço reduzido.',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12),
              Icon(Icons.volunteer_activism, color: Colors.white, size: 40),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _Indicador(
                  valor: '${resumo.totalLotes}',
                  rotulo: 'lotes hoje',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _Indicador(
                  valor: '${resumo.totalPorcoes}',
                  rotulo: 'porções',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _Indicador(
                  valor: formatarPeso(resumo.totalKg),
                  rotulo: 'de alimentos',
                ),
              ),
            ],
          ),
          if (resumo.possuiResgates) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.secondaryContainer,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: AppColors.secondary),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Você já resgatou ${formatarPorcoes(resumo.porcoesResgatadas)} '
                      '(${formatarPeso(resumo.kgResgatados)} de comida salva)',
                      style: const TextStyle(
                        color: AppColors.onSecondaryContainer,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Número de impacto exibido dentro do banner.
class _Indicador extends StatelessWidget {
  final String valor;
  final String rotulo;

  const _Indicador({required this.valor, required this.rotulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            valor,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            rotulo,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
