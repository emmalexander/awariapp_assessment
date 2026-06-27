import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class SpringButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;

  const SpringButton({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  State<SpringButton> createState() => _SpringButtonState();
}

class _SpringButtonState extends State<SpringButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0,
    );
    _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.onTap == null) return;
    _controller.animateTo(
      0.92,
      duration: const Duration(milliseconds: 60),
      curve: Curves.easeOut,
    );
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.onTap == null) return;
    _playSpring();
    widget.onTap?.call();
  }

  void _onTapCancel() {
    if (widget.onTap == null) return;
    _playSpring();
  }

  void _playSpring() {
    final spring = SpringDescription(
      mass: 1.0,
      stiffness: 400.0,
      damping: 18.0,
    );
    final simulation = SpringSimulation(
      spring,
      _controller.value,
      1.0,
      0.0,
    );
    _controller.animateWith(simulation);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      behavior: HitTestBehavior.opaque,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _controller.value,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
