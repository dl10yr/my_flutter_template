import 'package:flutter/material.dart';
import 'package:flutter_my_blueprint/routing/routes/bottom_tab/search/search_branch.dart';
import 'package:flutter_my_blueprint/routing/start_up_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StartScreen extends HookConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('Go To BottomTabScreen'),
          onPressed: () {
            const SearchTabRoute().go(context);
          },
        ),
      ),
    );
  }
}
