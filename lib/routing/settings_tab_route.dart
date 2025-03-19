import 'package:flutter/material.dart';
import 'package:flutter_my_blueprint/ui/settings/settings_screen.dart';
import 'package:go_router/go_router.dart';

class SettingsTabRoute extends GoRouteData {
  const SettingsTabRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsScreen();
}
