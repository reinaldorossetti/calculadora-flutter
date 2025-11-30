import 'package:flutter/material.dart';

enum ButtonType { normal, dark, operation }

class Button extends StatelessWidget {
  static const darkColor = Color(0xFF424242);
  static const defaultColor = Color.fromARGB(255, 63, 61, 61);
  static const operationColor = Color.fromARGB(255, 21, 115, 162);

  final String text;
  final bool big;
  final ButtonType type;
  final void Function(String) cb;

  const Button({
    Key? key,
    required this.text,
    this.big = false,
    this.type = ButtonType.normal,
    required this.cb,
  }) : super(key: key);

  const Button.big({
    Key? key,
    required this.text,
    this.big = true,
    this.type = ButtonType.normal,
    required this.cb,
  }) : super(key: key);

  const Button.operation({
    Key? key,
    required this.text,
    this.big = false,
    this.type = ButtonType.operation,
    required this.cb,
  }) : super(key: key);

  Color _getButtonColor(BuildContext context) {
    switch (type) {
      case ButtonType.dark:
        return darkColor;
      case ButtonType.operation:
        return operationColor;
      case ButtonType.normal:
      default:
        return defaultColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final buttonColor = _getButtonColor(context);
    final isOperation = type == ButtonType.operation;

    return Expanded(
      flex: big ? 2 : 1,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: isOperation ? 3 : 1,
            padding: const EdgeInsets.symmetric(vertical: 24),
          ),
          onPressed: () => cb(text),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 28,
              fontWeight: isOperation ? FontWeight.w500 : FontWeight.w300,
            ),
          ),
        ),
      ),
    );
  }
}
