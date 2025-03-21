import 'package:flutter/material.dart';
import 'package:flutter_my_blueprint/core/flavor/app_flavor.dart';

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
