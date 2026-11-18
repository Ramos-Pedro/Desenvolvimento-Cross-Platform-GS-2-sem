// Funções que formatam valores no padrão brasileiro.

/// Ex.: 12.9 → "R$ 12,90"
String formatarPreco(double valor) {
  return 'R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',')}';
}

/// Ex.: 0.5 → "0,5 kg" | 1.0 → "1 kg" | 102.8 → "103 kg"
String formatarPeso(double kg) {
  if (kg >= 10 || kg == kg.roundToDouble()) {
    return '${kg.round()} kg';
  }
  return '${kg.toStringAsFixed(1).replaceAll('.', ',')} kg';
}

/// Ex.: 1 → "1 porção" | 8 → "8 porções"
String formatarPorcoes(int quantidade) {
  return quantidade == 1 ? '1 porção' : '$quantidade porções';
}
