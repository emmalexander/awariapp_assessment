import 'package:flutter/material.dart';
import 'core/state/app_state.dart';
import 'core/theme/app_theme.dart';
import 'screens/onboarding/onboarding_screen.dart';

class AwariApp extends StatefulWidget {
  const AwariApp({super.key});

  @override
  State<AwariApp> createState() => _AwariAppState();
}

class _AwariAppState extends State<AwariApp> {
  final AppState _appState = AppState();

  @override
  void dispose() {
    _appState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppStateProvider(
      state: _appState,
      child: MaterialApp(
        title: 'Awari',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const OnboardingScreen(),
      ),
    );
  }
}
