import 'package:flutter/material.dart';
import 'package:flutter_my_blueprint/core/flavor/app_flavor.dart';
import 'package:flutter_my_blueprint/core/ui/theme_mode/provider/theme_mode_notifier.dart';
import 'package:flutter_my_blueprint/core/widgets/modal_bottom_sheet/show_list_bottom_sheet.dart';
import 'package:flutter_my_blueprint/routing/go_router_provider.dart';

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
        title: const Text('select theme'),
        onTap: () async {
          final selectedIndex = await showListBottomSheet(
            context: context,
            items: ThemeMode.values,
          );

          if (selectedIndex != null) {
            final themeMode = ThemeMode.values[selectedIndex];
            ref.read(themeModeNotifierProvider.notifier).save(themeMode);
          }
        },
      ),
      ListTile(
        title: const Text('go to license'),
        onTap: () {
          const LicensePageRoute().push<void>(context);
        },
      ),
      ListTile(
        title: const Text('go to web_view'),
        onTap: () {
          const WebViewPageRoute().push<void>(context);
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
