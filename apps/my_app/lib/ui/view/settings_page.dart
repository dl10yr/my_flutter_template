import 'dart:async';

import 'package:cores_core/flavor/app_flavor.dart';
import 'package:cores_core/ui/theme_mode/provider/theme_mode_notifier.dart';
import 'package:cores_core/widgets/modal_bottom_sheet/show_list_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/routing/go_router_provider.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flavor = stringToFlavor(const String.fromEnvironment('flavor'));
    final settingItems = [
      ListTile(
        title: Text(
          'appFlavor: $flavor',
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
            ref.read(themeModeProvider.notifier).save(themeMode);
          }
        },
      ),
      ListTile(
        title: const Text('go to license'),
        onTap: () {
          unawaited(const LicensePageRoute().push<void>(context));
        },
      ),
      ListTile(
        title: const Text('go to web_view'),
        onTap: () {
          unawaited(const WebViewPageRoute().push<void>(context));
        },
      ),
      if (!isPrd())
        ListTile(
          title: const Text('go to debug'),
          onTap: () {
            unawaited(const DebugRoute().push<void>(context));
          },
        ),
    ];

    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: settingItems.length,
        itemBuilder: (context, index) {
          return settingItems[index];
        },
      ),
    );
  }
}
