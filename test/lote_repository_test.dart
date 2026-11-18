import 'package:flutter_test/flutter_test.dart';
import 'package:segunda_mesa/models/categoria.dart';
import 'package:segunda_mesa/repositories/lote_repository.dart';

void main() {
  test('o repositório possui pelo menos 5 lotes', () {
    final repository = LoteRepository();

    expect(repository.listarTodos().length, greaterThanOrEqualTo(5));
  });

  test('categoria nula ("Todas") retorna todos os lotes', () {
    final repository = LoteRepository();

    expect(
      repository.filtrarPorCategoria(null).length,
      repository.listarTodos().length,
    );
  });

  test('o filtro retorna somente lotes da categoria escolhida', () {
    final repository = LoteRepository();

    final lotes = repository.filtrarPorCategoria(Categoria.padaria);

    expect(lotes, isNotEmpty);
    for (final lote in lotes) {
      expect(lote.categorias.contains(Categoria.padaria), isTrue);
    }
  });

  test('um lote com duas categorias aparece nos dois filtros', () {
    final repository = LoteRepository();
    final salgados = repository.buscarPorId(8);

    expect(
        repository.filtrarPorCategoria(Categoria.padaria), contains(salgados));
    expect(repository.filtrarPorCategoria(Categoria.refeicoes),
        contains(salgados));
  });

  test('os destaques vêm dos próprios dados (atributo destaque)', () {
    final repository = LoteRepository();

    final destaques = repository.listarDestaques();

    expect(destaques.length, greaterThanOrEqualTo(3));
    expect(destaques.every((lote) => lote.destaque), isTrue);
  });

  test('reservar diminui as porções e atualiza o resumo', () {
    final repository = LoteRepository();

    repository.reservar(1, 3);

    expect(repository.buscarPorId(1).porcoes, 5);
    expect(repository.gerarResumo().porcoesResgatadas, 3);
  });

  test('não reserva mais porções do que as disponíveis', () {
    final repository = LoteRepository();

    repository.reservar(1, 99);

    expect(repository.buscarPorId(1).porcoes, 8);
  });
}
