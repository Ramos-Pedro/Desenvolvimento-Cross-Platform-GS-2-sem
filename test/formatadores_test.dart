import 'package:flutter_test/flutter_test.dart';
import 'package:segunda_mesa/utils/formatadores.dart';

void main() {
  test('formata o preço em reais', () {
    expect(formatarPreco(12.9), 'R\$ 12,90');
    expect(formatarPreco(8), 'R\$ 8,00');
  });

  test('formata o peso em quilos', () {
    expect(formatarPeso(0.5), '0,5 kg');
    expect(formatarPeso(1.0), '1 kg');
    expect(formatarPeso(102.8), '103 kg');
  });

  test('usa singular e plural nas porções', () {
    expect(formatarPorcoes(1), '1 porção');
    expect(formatarPorcoes(8), '8 porções');
  });
}
