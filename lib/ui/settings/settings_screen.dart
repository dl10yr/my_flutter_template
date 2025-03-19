// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: 0,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text(''), onTap: () {});
        },
      ),
    );
  }
}
