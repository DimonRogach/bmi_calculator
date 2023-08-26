import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  final Color color;
  final Widget myChild;
  final VoidCallback onpress;

  const ReuseableCard({
    super.key,
    required this.color,
    required this.myChild,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(
          5.0,
        ),
        child: GestureDetector(
          onTap: onpress,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: myChild,
          ),
        ),
      ),
    );
  }
}
