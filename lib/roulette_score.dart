import 'package:flutter/material.dart';

class RouletteScore extends StatelessWidget {
  final int selected;

  final Map<String, String> labels;

  RouletteScore(this.selected, this.labels);

  @override
  Widget build(BuildContext context) {
    return Text('${labels[selected.toString()]}',
        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 24.0),
    );
  }
}
