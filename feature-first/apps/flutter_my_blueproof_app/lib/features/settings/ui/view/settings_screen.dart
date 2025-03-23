import 'package:flutter/material.dart';
import 'package:flutter_my_blueprint/core/flavor/app_flavor.dart';
import 'package:flutter_my_blueprint/routing/routes/bottom_tab/settings/settings_branch.dart';
import 'package:flutter_my_blueprint/routing/start_up_route.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingItems = [
      ListTile(
        title: Text(
          'appFlavor: ${stringToFlavor(const String.fromEnvironment('flavor'))}',
        ),
        onTap: () {},
      ),
      ListTile(
        title: const Text('go to license'),
        onTap: () {
          const LicensePageRoute().push<void>(context);
        },
      ),
    ];

    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: settingItems.length,
        itemBuilder: (BuildContext context, int index) {
          return settingItems[index];
        },
      ),
    );
  }
}
