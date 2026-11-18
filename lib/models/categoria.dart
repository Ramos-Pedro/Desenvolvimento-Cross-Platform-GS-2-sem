import 'package:flutter/material.dart';

/// Categorias dos lotes de alimentos excedentes.
///
/// "Todas" não é uma categoria de alimento, e sim uma opção do filtro.
/// Por isso, na tela, ela é representada por `Categoria? categoriaSelecionada = null`,
/// o que evita cadastrar um lote com uma categoria fictícia.
enum Categoria {
  padaria('Padaria', Icons.bakery_dining),
  refeicoes('Refeições', Icons.restaurant),
  hortifruti('Hortifrúti', Icons.eco),
  confeitaria('Confeitaria', Icons.cake),
  mercearia('Mercearia', Icons.shopping_basket),
  bebidas('Bebidas', Icons.local_drink);

  /// Texto exibido na interface.
  final String rotulo;

  /// Ícone que representa a categoria.
  final IconData icone;

  const Categoria(this.rotulo, this.icone);
}
