import 'package:catalogo_pontos_turisticos/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Exibe aluno e os sete locais com imagens e duas marcações', (
    tester,
  ) async {
    await tester.pumpWidget(const Principal());
    await tester.pumpAndSettle();

    expect(find.text('Danilo Almeida Brito'), findsOneWidget);

    const locais = <String>[
      'Museu Pelé',
      'Vila Belmiro',
      'Museu do Café',
      'Monte Serrat',
      'Ilha Porchat',
      'Biquinha de Anchieta',
      'Forte São João',
    ];

    for (final local in locais) {
      await tester.scrollUntilVisible(find.text(local), 200);
      await tester.pumpAndSettle();
      final item = find
          .ancestor(of: find.text(local), matching: find.byType(Container))
          .first;
      expect(
        find.descendant(of: item, matching: find.byType(Image)),
        findsOneWidget,
      );
      expect(
        find.descendant(of: item, matching: find.byType(Checkbox)),
        findsNWidgets(2),
      );
      expect(tester.takeException(), isNull);
    }
  });

  testWidgets('Marca e desmarca favorito e visitado de forma independente', (
    tester,
  ) async {
    await tester.pumpWidget(const Principal());
    await tester.pumpAndSettle();

    final favorito = find.byType(Checkbox).at(0);
    final visitado = find.byType(Checkbox).at(1);

    expect(tester.widget<Checkbox>(favorito).value, isFalse);
    expect(tester.widget<Checkbox>(visitado).value, isFalse);

    await tester.tap(favorito);
    await tester.pumpAndSettle();
    expect(tester.widget<Checkbox>(favorito).value, isTrue);
    expect(tester.widget<Checkbox>(visitado).value, isFalse);

    await tester.tap(visitado);
    await tester.pumpAndSettle();
    expect(tester.widget<Checkbox>(favorito).value, isTrue);
    expect(tester.widget<Checkbox>(visitado).value, isTrue);

    await tester.scrollUntilVisible(find.text('Forte São João'), 300);
    await tester.scrollUntilVisible(find.text('Museu Pelé'), -300);
    await tester.pumpAndSettle();
    expect(tester.widget<Checkbox>(favorito).value, isTrue);
    expect(tester.widget<Checkbox>(visitado).value, isTrue);

    await tester.tap(favorito);
    await tester.pumpAndSettle();
    expect(tester.widget<Checkbox>(favorito).value, isFalse);
    expect(tester.widget<Checkbox>(visitado).value, isTrue);

    await tester.tap(visitado);
    await tester.pumpAndSettle();
    expect(tester.widget<Checkbox>(visitado).value, isFalse);
  });

  testWidgets('Reiniciar a tela limpa as marcações', (tester) async {
    await tester.pumpWidget(const Principal());
    await tester.pumpAndSettle();
    await tester.tap(find.byType(Checkbox).first);
    await tester.pumpAndSettle();

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pumpWidget(const Principal());
    await tester.pumpAndSettle();

    expect(tester.widget<Checkbox>(find.byType(Checkbox).first).value, isFalse);
  });

  testWidgets('Não apresenta estouro de layout em tela de celular', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const Principal());
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(find.text('Forte São João'), 200);
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });
}
