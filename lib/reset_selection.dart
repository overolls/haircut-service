import 'package:flutter/material.dart';

class ResetSelectionButton extends StatelessWidget {
  final VoidCallback onReset;

  const ResetSelectionButton({super.key, required this.onReset});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.refresh, color: Colors.black),
      tooltip: "Reset selections",
      onPressed: onReset,
    );
  }
}
