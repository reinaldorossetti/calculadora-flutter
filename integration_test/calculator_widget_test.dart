import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator/screens/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Calculator Widget - Operações Básicas', () {
    testWidgets('CTW01 - Deve inicializar com valor 0', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      expect(_displayValue(tester), '0');
      expect(find.text('Sem histórico'), findsOneWidget);
    });

    testWidgets('CTW02 - Deve adicionar dígitos corretamente', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['5', '3']);

      expect(_displayValue(tester), '53');
    });

    testWidgets('CTW03 - Deve adicionar ponto decimal', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['5', '.', '5']);

      expect(_displayValue(tester), '5.5');
    });

    testWidgets('CTW04 - Deve lidar com múltiplos pontos decimais', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['5', '.', '5', '.', '3']);

      expect(_displayValue(tester), '5.53');
    });
  });

  group('Calculator Widget - Operação de Adição (+)', () {
    testWidgets('CTW05 - Deve somar dois números inteiros', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['7', '+', '5', '=']);

      expect(_displayValue(tester), '12');
      expect(find.textContaining('7 + 5 = 12'), findsOneWidget);
    });

    testWidgets('CTW06 - Deve somar números decimais', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['2', '.', '5', '+', '3', '.', '5', '=']);

      expect(_displayValue(tester), '6');
      expect(find.textContaining('2.5 + 3.5 = 6'), findsOneWidget);
    });

    testWidgets('CTW07 - Deve realizar soma em cadeia', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['1', '+', '2', '+', '3', '=']);

      expect(_displayValue(tester), '6');
    });
  });

  group('Calculator Widget - Operação de Subtração (-)', () {
    testWidgets('CTW08 - Deve subtrair dois números inteiros', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['1', '0', '-', '5', '=']);

      expect(_displayValue(tester), '5');
      expect(find.textContaining('10 - 5 = 5'), findsOneWidget);
    });

    testWidgets('CTW09 - Deve subtrair números decimais', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['5', '.', '5', '-', '2', '.', '5', '=']);

      expect(_displayValue(tester), '3');
      expect(find.textContaining('5.5 - 2.5 = 3'), findsOneWidget);
    });

    testWidgets('CTW10 - Deve resultar em número negativo', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['5', '-', '1', '0', '=']);

      expect(_displayValue(tester), '-5');
      expect(find.textContaining('5 - 10 = -5'), findsOneWidget);
    });

    testWidgets('CTW11 - Deve realizar subtração em cadeia', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['1', '0', '-', '3', '-', '2', '=']);

      expect(_displayValue(tester), '5');
    });
  });

  group('Calculator Widget - Operação de Multiplicação (x)', () {
    testWidgets('CTW12 - Deve multiplicar dois números inteiros', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['5', 'x', '3', '=']);

      expect(_displayValue(tester), '15');
      expect(find.textContaining('5 x 3 = 15'), findsOneWidget);
    });

    testWidgets('CTW13 - Deve multiplicar números decimais', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['2', '.', '5', 'x', '4', '=']);

      expect(_displayValue(tester), '10');
      expect(find.textContaining('2.5 x 4 = 10'), findsOneWidget);
    });

    testWidgets('CTW14 - Deve multiplicar por zero', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['5', 'x', '0', '=']);

      expect(_displayValue(tester), '0');
      expect(find.textContaining('5 x 0 = 0'), findsOneWidget);
    });

    testWidgets('CTW15 - Deve realizar multiplicação em cadeia', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['2', 'x', '3', 'x', '4', '=']);

      expect(_displayValue(tester), '24');
    });
  });

  group('Calculator Widget - Operação de Divisão (/)', () {
    testWidgets('CTW16 - Deve dividir dois números inteiros', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['1', '0', '/', '2', '=']);

      expect(_displayValue(tester), '5');
      expect(find.textContaining('10 / 2 = 5'), findsOneWidget);
    });

    testWidgets('CTW17 - Deve dividir números decimais', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['7', '.', '5', '/', '2', '.', '5', '=']);

      expect(_displayValue(tester), '3');
      expect(find.textContaining('7.5 / 2.5 = 3'), findsOneWidget);
    });

    testWidgets('CTW18 - Deve realizar divisão em cadeia', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['1', '0', '0', '/', '5', '/', '2', '=']);

      expect(_displayValue(tester), '10');
    });
  });

  group('Calculator Widget - Operação de Módulo (%)', () {
    testWidgets('CTW19 - Deve calcular o resto da divisão', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['1', '0', '%', '3', '=']);

      expect(_displayValue(tester), '1');
      expect(find.textContaining('10 % 3 = 1'), findsOneWidget);
    });

    testWidgets('CTW20 - Deve retornar zero quando divisível', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['1', '0', '%', '5', '=']);

      expect(_displayValue(tester), '0');
      expect(find.textContaining('10 % 5 = 0'), findsOneWidget);
    });

    testWidgets('CTW21 - Deve calcular módulo com decimais', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['7', '.', '5', '%', '2', '=']);

      expect(_displayValue(tester), '1.5');
      expect(find.textContaining('7.5 % 2 = 1.5'), findsOneWidget);
    });
  });

  group('Calculator Widget - Função AC (All Clear)', () {
    testWidgets('CTW22 - Deve limpar valor atual', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['5', '3']);
      expect(_displayValue(tester), '53');

      await _tapSequence(tester, ['AC']);
      expect(_displayValue(tester), '0');
    });

    testWidgets('CTW23 - Deve limpar operação em andamento', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['5', '+', '3', 'AC', '2', '=']);

      expect(_displayValue(tester), '2');
    });

    testWidgets('CTW24 - Deve limpar histórico', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['9', '-', '4', '=']);
      expect(_displayValue(tester), '5');
      expect(find.textContaining('9 - 4 = 5'), findsOneWidget);

      await _tapSequence(tester, ['AC']);
      expect(_displayValue(tester), '0');
      expect(find.text('Sem histórico'), findsOneWidget);
    });
  });

  group('Calculator Widget - Histórico de Operações', () {
    testWidgets('CTW25 - Deve armazenar uma operação no histórico', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['5', '+', '3', '=']);

      expect(_displayValue(tester), '8');
      expect(find.textContaining('5 + 3 = 8'), findsOneWidget);
    });

    testWidgets('CTW26 - Deve manter histórico em cálculos encadeados', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['5', '+', '3', '=', 'x', '2', '=']);

      expect(_displayValue(tester), '16');
      expect(find.textContaining('8 x 2 = 16'), findsOneWidget);
      expect(find.textContaining('5 + 3 = 8'), findsOneWidget);
    });

    testWidgets('CTW27 - Deve remover operação mais antiga ao exceder 2', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['2', '+', '2', '=']);
      await _tapSequence(tester, ['x', '3', '=']);
      await _tapSequence(tester, ['-', '5', '=']);

      expect(_displayValue(tester), '7');
      expect(find.textContaining('4 x 3 = 12'), findsOneWidget);
      expect(find.textContaining('12 - 5 = 7'), findsOneWidget);
      expect(find.textContaining('2 + 2 = 4'), findsNothing);
    });

    testWidgets('CTW28 - Deve formatar números sem decimais desnecessários', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['5', '.', '0', '+', '3', '.', '0', '=']);

      expect(_displayValue(tester), '8');
      expect(find.textContaining('5 + 3 = 8'), findsOneWidget);
    });
  });

  group('Calculator Widget - Casos Especiais', () {
    testWidgets('CTW29 - Deve trocar operador antes de digitar segundo número', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['5', '+', '-', '3', '=']);

      expect(_displayValue(tester), '2');
      expect(find.textContaining('5 - 3 = 2'), findsOneWidget);
    });

    testWidgets('CTW30 - Deve iniciar novo cálculo após igual', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['5', '+', '3', '=']);
      expect(_displayValue(tester), '8');

      await _tapSequence(tester, ['2', '3', '+', '2', '3', '=']);
      expect(_displayValue(tester), '46');
    });

    testWidgets('CTW31 - Deve lidar com zero à esquerda', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['0', '5']);

      expect(_displayValue(tester), '5');
    });

    testWidgets('CTW32 - Deve permitir ponto decimal após zero', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['0', '.', '5']);

      expect(_displayValue(tester), '0.5');
    });

    testWidgets('CTW33 - Deve exibir todos os botões da calculadora', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      // Verifica números
      for (var i = 0; i <= 9; i++) {
        expect(_buttonFinder(i.toString()), findsOneWidget);
      }

      // Verifica operadores
      expect(_buttonFinder('+'), findsOneWidget);
      expect(_buttonFinder('-'), findsOneWidget);
      expect(_buttonFinder('x'), findsOneWidget);
      expect(_buttonFinder('/'), findsOneWidget);
      expect(_buttonFinder('%'), findsOneWidget);
      expect(_buttonFinder('='), findsOneWidget);
      expect(_buttonFinder('AC'), findsOneWidget);
      expect(_buttonFinder('.'), findsOneWidget);
    });

    testWidgets('CTW34 - Deve realizar operações mistas complexas', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['8', '+', '2', '=']);
      expect(_displayValue(tester), '10');

      await _tapSequence(tester, ['x', '5', '=']);
      expect(_displayValue(tester), '50');

      await _tapSequence(tester, ['/', '2', '=']);
      expect(_displayValue(tester), '25');

      await _tapSequence(tester, ['-', '5', '=']);
      expect(_displayValue(tester), '20');
    });

    testWidgets('CTW35 - Deve continuar operação após resultado', (tester) async {
      await tester.pumpWidget(const Calculator());
      await tester.pumpAndSettle();

      await _tapSequence(tester, ['1', '0', '+', '5', '=']);
      expect(_displayValue(tester), '15');

      await _tapSequence(tester, ['+', '1', '0', '=']);
      expect(_displayValue(tester), '25');
      expect(find.textContaining('15 + 10 = 25'), findsOneWidget);
    });
  });
}

Future<void> _tapSequence(WidgetTester tester, List<String> sequence) async {
  for (final label in sequence) {
    await tester.tap(_buttonFinder(label));
    await tester.pumpAndSettle();
  }
}

Finder _buttonFinder(String label) {
  return find.widgetWithText(FilledButton, label);
}

String _displayValue(WidgetTester tester) {
  final displayFinder = find.byType(AutoSizeText);
  expect(displayFinder, findsOneWidget);
  final displayWidget = tester.widget<AutoSizeText>(displayFinder);
  final text = displayWidget.data ??
      (displayWidget.textSpan != null
          ? displayWidget.textSpan!.toPlainText()
          : null);
  return text ?? '';
}
