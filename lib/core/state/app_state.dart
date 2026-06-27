import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {}

class AppStateProvider extends InheritedWidget {
  final AppState state;

  const AppStateProvider({
    super.key,
    required this.state,
    required super.child,
  });

  static AppState of(BuildContext context, {bool listen = true}) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<AppStateProvider>()!
          .state;
    } else {
      final element = context
          .getElementForInheritedWidgetOfExactType<AppStateProvider>();
      return (element?.widget as AppStateProvider).state;
    }
  }

  @override
  bool updateShouldNotify(AppStateProvider oldWidget) {
    return state != oldWidget.state;
  }
}
