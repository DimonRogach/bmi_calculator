import 'package:flutter/material.dart';

class RoundedBTN extends StatelessWidget {
  final IconData icon;
  final VoidCallback onpress;
  final Color color;

  const RoundedBTN({
    super.key,
    required this.icon,
    required this.onpress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpress,
      elevation: 8,
      constraints: const BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      shape: const CircleBorder(),
      fillColor: color,
      child: Icon(
        icon,
        size: 15,
      ),
    );
  }
}
