import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/routing/go_router_provider.dart';

class StartPage extends HookConsumerWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('Go To BottomTabPage'),
          onPressed: () {
            const SearchTabRoute().go(context);
          },
        ),
      ),
    );
  }
}
