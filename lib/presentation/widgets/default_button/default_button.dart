import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {required this.minWidth,
      required this.label,
      required this.onPressed,
      super.key});
  final double minWidth;
  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: minWidth),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(label.toUpperCase()),
        ),
      ),
    );
  }
}
