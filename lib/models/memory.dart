class Memory {
  static const operations = ['%', '/', 'x', '-', '+', '='];

  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String? _operation;
  String _value = '0';
  bool _wipeValue = false;
  String? _lastCommand;
  final List<String> _history = []; // Histórico das últimas 2 operações

  void applyCommand(String command) {
    if (_isReplacingOperation(command)) {
      _operation = command;
      return;
    }

    if (command == 'AC') {
      _allClear();
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }

    _lastCommand = command;
  }

  _isReplacingOperation(String command) {
    return operations.contains(_lastCommand) &&
        operations.contains(command) &&
        _lastCommand != '=' &&
        command != '=';
  }

  _setOperation(String newOperation) {
    bool isEqualSign = newOperation == '=';
    if (_bufferIndex == 0) {
      if (!isEqualSign) {
        _operation = newOperation;
        _bufferIndex = 1;
        _wipeValue = true;
      }
    } else {
      double result = _calculate();
      
      // Formatar números para o histórico
      String num1 = _formatNumber(_buffer[0]);
      String num2 = _formatNumber(_buffer[1]);
      String resultStr = _formatNumber(result);
      String operationString = '$num1 $_operation $num2 = $resultStr';
      _addToHistory(operationString);
      
      _buffer[0] = result;
      _buffer[1] = 0.0;
      _value = _buffer[0].toString();
      _value = _value.endsWith('.0') ? _value.split('.')[0] : _value;

      _operation = isEqualSign ? null : newOperation;
      _bufferIndex = isEqualSign ? 0 : 1;
    }

    _wipeValue = true; // !isEqualSign;
  }

  _addDigit(String digit) {
    final isDot = digit == '.';
    final wipeValue = (_value == '0' && !isDot) || _wipeValue;

    if (isDot && _value.contains('.') && !wipeValue) {
      return;
    }

    final emptyValue = isDot ? '0' : '';
    final currentValue = wipeValue ? emptyValue : _value;
    _value = currentValue + digit;
    _wipeValue = false;

    _buffer[_bufferIndex] = double.tryParse(_value) ?? 0;
  }

  _allClear() {
    _value = '0';
    _buffer.setAll(0, [0.0, 0.0]);
    _bufferIndex = 0;
    _operation = null;
    _wipeValue = false;
    _history.clear();
  }

  _calculate() {
    switch (_operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        if (_buffer[1] == 0) {
          return null; // Evita divisão por zero
        }
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0];
    }
  }

  void _addToHistory(String operation) {
    _history.add(operation);
    if (_history.length > 2) {
      _history.removeAt(0); // Remove a operação mais antiga
    }
  }

  String _formatNumber(double number) {
    String str = number.toString();
    return str.endsWith('.0') ? str.split('.')[0] : str;
  }

  String get value {
    return _value;
  }

  List<String> get history {
    return List.unmodifiable(_history); // Retorna cópia imutável
  }

  String get historyText {
    if (_history.isEmpty) return 'Sem histórico';
    return _history.reversed.join('\n');
  }
}
