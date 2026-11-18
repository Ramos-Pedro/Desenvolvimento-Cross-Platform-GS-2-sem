import 'package:flutter/material.dart';

import '../models/categoria.dart';
import 'categoria_chip.dart';

/// Lista horizontal de categorias com a opção "Todas".
///
/// O seletor não guarda o filtro: ele apenas avisa a tela qual opção foi
/// tocada. A opção "Todas" é enviada como null.
class CategoriaSelector extends StatelessWidget {
  final List<Categoria> categorias;
  final Categoria? categoriaSelecionada;
  final ValueChanged<Categoria?> onCategoriaSelecionada;

  const CategoriaSelector({
    super.key,
    required this.categorias,
    required this.categoriaSelecionada,
    required this.onCategoriaSelecionada,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        // +1 porque o primeiro item é a opção "Todas".
        itemCount: categorias.length + 1,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          if (index == 0) {
            return CategoriaChip(
              rotulo: 'Todas',
              icone: Icons.apps,
              selecionada: categoriaSelecionada == null,
              onTap: () => onCategoriaSelecionada(null),
            );
          }

          final categoria = categorias[index - 1];
          return CategoriaChip(
            rotulo: categoria.rotulo,
            icone: categoria.icone,
            selecionada: categoria == categoriaSelecionada,
            onTap: () => onCategoriaSelecionada(categoria),
          );
        },
      ),
    );
  }
}
