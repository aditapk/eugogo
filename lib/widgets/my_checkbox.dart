import 'package:flutter/material.dart';

class MyCheckbox extends StatelessWidget {
  const MyCheckbox({
    super.key,
    this.text,
    required this.value,
    required this.onChanged,
    this.space,
    this.textStyle,
    this.alignment,
  });

  final String? text;
  final bool value;
  final Function(bool?)? onChanged;
  final double? space;
  final TextStyle? textStyle;
  final MainAxisAlignment? alignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment ?? MainAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        if (space != null)
          SizedBox(
            width: space,
          ),
        Text(
          text ?? "untitle",
          style: textStyle,
        ),
      ],
    );
  }
}
