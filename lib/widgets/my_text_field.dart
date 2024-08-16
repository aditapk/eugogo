import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    this.title,
    this.controller,
    this.enabled,
  });

  final String? title;
  final TextEditingController? controller;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        enabled: enabled,
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(title ?? "untitle"),
        ),
      ),
    );
  }
}
