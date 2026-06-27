import 'package:awariapp_assessment/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AutoScrollingText extends StatefulWidget {
  final String text;
  const AutoScrollingText({super.key, required this.text});

  @override
  State<AutoScrollingText> createState() => _AutoScrollingTextState();
}

class _AutoScrollingTextState extends State<AutoScrollingText> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scroll());
  }

  void _scroll() async {
    while (_scrollController.hasClients) {
      await _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 5),
        curve: Curves.linear,
      );

      await Future.delayed(const Duration(seconds: 1));

      await _scrollController.animateTo(
        0.0,
        duration: const Duration(seconds: 5),
        curve: Curves.linear,
      );

      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      child: Text(
        widget.text,
        style: const TextStyle(
          fontSize: 70,
          fontWeight: FontWeight.w700,
          color: AppTheme.darkSlate,
        ),
      ),
    );
  }
}
