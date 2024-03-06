import 'package:flutter/material.dart';

class PromtContainer extends StatelessWidget {
  final String prompt;
  const PromtContainer({super.key, required this.prompt});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white, width: 0.5)),
      width: 200,
      child: Text(prompt),
    );
  }
}
