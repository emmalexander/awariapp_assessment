import 'package:flutter/material.dart';
import 'spring_button.dart';

class CustomIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;
  final double size;
  final Color? backgroundColor;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.size = 48,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SpringButton(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: const Color(0xFFF6F4E8),
          borderRadius: BorderRadius.circular(50),
        ),
        alignment: Alignment.center,
        child: icon,
      ),
    );
  }
}
