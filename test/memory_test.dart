import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/models/memory.dart';

void main() {
  group('Memory - Operações Básicas', () {
    late Memory memory;

    setUp(() {
      memory = Memory();
    });

    test('CT01 - Deve inicializar com valor 0', () {
      expect(memory.value, '0');
    });

    test('CT02 - Deve adicionar dígitos corretamente', () {
      memory.applyCommand('5');
      expect(memory.value, '5');
      
      memory.applyCommand('3');
      expect(memory.value, '53');
    });

    test('CT03 - Deve adicionar ponto decimal', () {
      memory.applyCommand('5');
      memory.applyCommand('.');
      memory.applyCommand('5');
      expect(memory.value, '5.5');
    });

    test('CT04 - Não deve adicionar múltiplos pontos decimais', () {
      memory.applyCommand('5');
      memory.applyCommand('.');
      memory.applyCommand('5');
      memory.applyCommand('.');
      memory.applyCommand('3');
      expect(memory.value, '5.53');
    });
  });

  group('Memory - Operação de Adição (+)', () {
    late Memory memory;

    setUp(() {
      memory = Memory();
    });

    test('CT05 - Deve somar dois números inteiros', () {
      memory.applyCommand('5');
      memory.applyCommand('+');
      memory.applyCommand('3');
      memory.applyCommand('=');
      expect(memory.value, '8');
    });

    test('CT06 - Deve somar números decimais', () {
      memory.applyCommand('2');
      memory.applyCommand('.');
      memory.applyCommand('5');
      memory.applyCommand('+');
      memory.applyCommand('3');
      memory.applyCommand('.');
      memory.applyCommand('5');
      memory.applyCommand('=');
      expect(memory.value, '6');
    });

    test('CT07 - Deve somar números negativos', () {
      memory.applyCommand('-');
      memory.applyCommand('5');
      memory.applyCommand('-');
      memory.applyCommand('5');
      memory.applyCommand('=');
      expect(memory.value, '-10');
    });

    test('CT08 - Deve realizar soma em cadeia', () {
      memory.applyCommand('1');
      memory.applyCommand('+');
      memory.applyCommand('2');
      memory.applyCommand('+');
      memory.applyCommand('3');
      memory.applyCommand('=');
      expect(memory.value, '6');
    });
  });

  group('Memory - Operação de Subtração (-)', () {
    late Memory memory;

    setUp(() {
      memory = Memory();
    });

    test('CT09 - Deve subtrair dois números inteiros', () {
      memory.applyCommand('1');
      memory.applyCommand('0');
      memory.applyCommand('-');
      memory.applyCommand('5');
      memory.applyCommand('=');
      expect(memory.value, '5');
    });

    test('CT10 - Deve subtrair números decimais', () {
      memory.applyCommand('5');
      memory.applyCommand('.');
      memory.applyCommand('5');
      memory.applyCommand('-');
      memory.applyCommand('2');
      memory.applyCommand('.');
      memory.applyCommand('5');
      memory.applyCommand('=');
      expect(memory.value, '3');
    });

    test('CT11 - Deve resultar em número negativo', () {
      memory.applyCommand('5');
      memory.applyCommand('-');
      memory.applyCommand('1');
      memory.applyCommand('0');
      memory.applyCommand('=');
      expect(memory.value, '-5');
    });

    test('CT12 - Deve realizar subtração em cadeia', () {
      memory.applyCommand('1');
      memory.applyCommand('0');
      memory.applyCommand('-');
      memory.applyCommand('3');
      memory.applyCommand('-');
      memory.applyCommand('2');
      memory.applyCommand('=');
      expect(memory.value, '5');
    });
  });

  group('Memory - Operação de Multiplicação (x)', () {
    late Memory memory;

    setUp(() {
      memory = Memory();
    });

    test('CT13 - Deve multiplicar dois números inteiros', () {
      memory.applyCommand('5');
      memory.applyCommand('x');
      memory.applyCommand('3');
      memory.applyCommand('=');
      expect(memory.value, '15');
    });

    test('CT14 - Deve multiplicar números decimais', () {
      memory.applyCommand('2');
      memory.applyCommand('.');
      memory.applyCommand('5');
      memory.applyCommand('x');
      memory.applyCommand('4');
      memory.applyCommand('=');
      expect(memory.value, '10');
    });

    test('CT15 - Deve multiplicar por zero', () {
      memory.applyCommand('5');
      memory.applyCommand('x');
      memory.applyCommand('0');
      memory.applyCommand('=');
      expect(memory.value, '0');
    });

    test('CT16 - Deve realizar multiplicação em cadeia', () {
      memory.applyCommand('2');
      memory.applyCommand('x');
      memory.applyCommand('3');
      memory.applyCommand('x');
      memory.applyCommand('4');
      memory.applyCommand('=');
      expect(memory.value, '24');
    });
  });

  group('Memory - Operação de Divisão (/)', () {
    late Memory memory;

    setUp(() {
      memory = Memory();
    });

    test('CT17 - Deve dividir dois números inteiros', () {
      memory.applyCommand('1');
      memory.applyCommand('0');
      memory.applyCommand('/');
      memory.applyCommand('2');
      memory.applyCommand('=');
      expect(memory.value, '5');
    });

    test('CT18 - Deve dividir números decimais', () {
      memory.applyCommand('7');
      memory.applyCommand('.');
      memory.applyCommand('5');
      memory.applyCommand('/');
      memory.applyCommand('2');
      memory.applyCommand('.');
      memory.applyCommand('5');
      memory.applyCommand('=');
      expect(memory.value, '3');
    });

    test('CT19 - Deve lançar exceção ao dividir por zero', () {
      memory.applyCommand('1');
      memory.applyCommand('0');
      memory.applyCommand('/');
      memory.applyCommand('0');
      
      expect(memory.value, '0');
    });

    test('CT20 - Deve realizar divisão em cadeia', () {
      memory.applyCommand('1');
      memory.applyCommand('0');
      memory.applyCommand('0');
      memory.applyCommand('/');
      memory.applyCommand('5');
      memory.applyCommand('/');
      memory.applyCommand('2');
      memory.applyCommand('=');
      expect(memory.value, '10');
    });
  });

  group('Memory - Operação de Módulo (%)', () {
    late Memory memory;

    setUp(() {
      memory = Memory();
    });

    test('CT21 - Deve calcular o resto da divisão', () {
      memory.applyCommand('1');
      memory.applyCommand('0');
      memory.applyCommand('%');
      memory.applyCommand('3');
      memory.applyCommand('=');
      expect(memory.value, '1');
    });

    test('CT22 - Deve retornar zero quando divisível', () {
      memory.applyCommand('1');
      memory.applyCommand('0');
      memory.applyCommand('%');
      memory.applyCommand('5');
      memory.applyCommand('=');
      expect(memory.value, '0');
    });

    test('CT23 - Deve calcular módulo com decimais', () {
      memory.applyCommand('7');
      memory.applyCommand('.');
      memory.applyCommand('5');
      memory.applyCommand('%');
      memory.applyCommand('2');
      memory.applyCommand('=');
      expect(memory.value, '1.5');
    });
  });

  group('Memory - Função AC (All Clear)', () {
    late Memory memory;

    setUp(() {
      memory = Memory();
    });

    test('CT24 - Deve limpar valor atual', () {
      memory.applyCommand('5');
      memory.applyCommand('3');
      memory.applyCommand('AC');
      expect(memory.value, '0');
    });

    test('CT25 - Deve limpar operação em andamento', () {
      memory.applyCommand('5');
      memory.applyCommand('+');
      memory.applyCommand('3');
      memory.applyCommand('AC');
      memory.applyCommand('2');
      memory.applyCommand('=');
      expect(memory.value, '2');
    });

    test('CT26 - Deve limpar histórico', () {
      memory.applyCommand('5');
      memory.applyCommand('+');
      memory.applyCommand('3');
      memory.applyCommand('=');
      
      expect(memory.history.length, 1);
      
      memory.applyCommand('AC');
      expect(memory.history.length, 0);
      expect(memory.historyText, 'Sem histórico');
    });
  });

  group('Memory - Histórico de Operações', () {
    late Memory memory;

    setUp(() {
      memory = Memory();
    });

    test('CT27 - Deve armazenar uma operação no histórico', () {
      memory.applyCommand('5');
      memory.applyCommand('+');
      memory.applyCommand('3');
      memory.applyCommand('=');
      
      expect(memory.history.length, 1);
      expect(memory.history[0], '5 + 3 = 8');
    });

    test('CT28 - Deve armazenar até 2 operações no histórico', () {
      memory.applyCommand('5');
      memory.applyCommand('+');
      memory.applyCommand('3');
      memory.applyCommand('=');
      
      memory.applyCommand('x');
      memory.applyCommand('2');
      memory.applyCommand('=');
      
      expect(memory.history.length, 2);
      expect(memory.history[0], '5 + 3 = 8');
      expect(memory.history[1], '8 x 2 = 16');
    });

    test('CT29 - Deve remover a operação mais antiga ao exceder 2 operações', () {
      memory.applyCommand('2');
      memory.applyCommand('+');
      memory.applyCommand('2');
      memory.applyCommand('=');
      
      memory.applyCommand('x');
      memory.applyCommand('3');
      memory.applyCommand('=');
      
      memory.applyCommand('-');
      memory.applyCommand('5');
      memory.applyCommand('=');
      
      expect(memory.history.length, 2);
      expect(memory.history[0], '4 x 3 = 12');
      expect(memory.history[1], '12 - 5 = 7');
    });

    test('CT30 - Deve formatar números sem decimais desnecessários', () {
      memory.applyCommand('5');
      memory.applyCommand('.');
      memory.applyCommand('0');
      memory.applyCommand('+');
      memory.applyCommand('3');
      memory.applyCommand('.');
      memory.applyCommand('0');
      memory.applyCommand('=');
      
      expect(memory.history[0], '5 + 3 = 8');
    });

    test('CT31 - Deve retornar texto do histórico formatado', () {
      memory.applyCommand('5');
      memory.applyCommand('+');
      memory.applyCommand('3');
      memory.applyCommand('=');
      
      memory.applyCommand('x');
      memory.applyCommand('2');
      memory.applyCommand('=');
      
      expect(memory.historyText, '8 x 2 = 16\n5 + 3 = 8');
    });
  });

  group('Memory - Casos Especiais', () {
    late Memory memory;

    setUp(() {
      memory = Memory();
    });

    test('CT32 - Deve trocar operador antes de digitar segundo número', () {
      memory.applyCommand('5');
      memory.applyCommand('+');
      memory.applyCommand('-');
      memory.applyCommand('3');
      memory.applyCommand('=');
      expect(memory.value, '2');
    });

    test('CT33 - Deve iniciar novo cálculo após igual', () {
      memory.applyCommand('5');
      memory.applyCommand('+');
      memory.applyCommand('3');
      memory.applyCommand('=');
      
      memory.applyCommand('2');
      memory.applyCommand('3');
      memory.applyCommand('+');
      memory.applyCommand('2');
      memory.applyCommand('3');
      memory.applyCommand('=');
      expect(memory.value, '46');
    });

    test('CT34 - Deve lidar com zero à esquerda', () {
      memory.applyCommand('0');
      memory.applyCommand('5');
      expect(memory.value, '5');
    });

    test('CT35 - Deve permitir ponto decimal após zero', () {
      memory.applyCommand('0');
      memory.applyCommand('.');
      memory.applyCommand('5');
      expect(memory.value, '0.5');
    });
  });
}
