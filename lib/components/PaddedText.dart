
import 'package:flutter/material.dart';

class PaddedText extends StatelessWidget {
  final String text;

  const PaddedText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Text(text));
  }
}