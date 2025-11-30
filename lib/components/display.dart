import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Display extends StatelessWidget {
  final String text;
  final String? history;

  const Display(this.text, {this.history, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorScheme.surface,
              colorScheme.surfaceContainerHighest,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (history != null && history!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  history!,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 16,
                    color: colorScheme.onSecondaryContainer,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: AutoSizeText(
                text,
                minFontSize: 24,
                maxFontSize: 72,
                maxLines: 1,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                  fontSize: 72,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
