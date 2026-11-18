import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:segunda_mesa/main.dart';

void main() {
  testWidgets('a tela inicial mostra o banner e os destaques', (tester) async {
    await tester.pumpWidget(const SegundaMesaApp());

    expect(find.text('Segunda Mesa'), findsOneWidget);
    expect(find.text('Comida boa ganha uma segunda mesa'), findsOneWidget);
    expect(find.text('Destaques do dia'), findsOneWidget);
    expect(find.text('Cesta de pães do dia'), findsWidgets);
  });

  testWidgets('selecionar uma categoria filtra a lista de lotes',
      (tester) async {
    await tester.pumpWidget(const SegundaMesaApp());

    // Rola a tela até a lista de categorias.
    await tester.drag(find.byType(ListView).first, const Offset(0, -300));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Padaria'));
    await tester.pumpAndSettle();

    // O contador de "Lotes disponíveis" passa a mostrar os 4 lotes de padaria
    // e o subtítulo da seção mostra a categoria escolhida.
    expect(find.text('4'), findsOneWidget);
    expect(find.text('Padaria'), findsNWidgets(2));
  });

  testWidgets('reservar um lote volta para a tela inicial com a confirmação',
      (tester) async {
    await tester.pumpWidget(const SegundaMesaApp());

    await tester.tap(find.text('Cesta de pães do dia').first);
    await tester.pumpAndSettle();
    expect(find.text('Detalhes do lote'), findsOneWidget);

    await tester.tap(find.textContaining('Reservar'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Confirmar'));
    await tester.pumpAndSettle();

    expect(
        find.textContaining('Reserva de 1 porção confirmada'), findsOneWidget);
    expect(find.textContaining('Você já resgatou 1 porção'), findsOneWidget);
  });
}
