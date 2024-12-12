import 'package:flutter/material.dart';

class MyCheckbox extends StatelessWidget {
  final bool checkValue;
  final Function(bool?)? onChanged;

  const MyCheckbox({
    super.key,
    required this.onChanged,
    required this.checkValue,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkValue,
      onChanged: onChanged,
    );
  }
}