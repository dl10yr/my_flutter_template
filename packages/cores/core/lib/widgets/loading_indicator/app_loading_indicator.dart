import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_loading_indicator_notifier.dart';

class AppLoadingIndicator extends ConsumerWidget {
  const AppLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(appLoadingIndicatorNotifierProvider);

    return Visibility(
      visible: isLoading,
      child: const SizedBox.expand(
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
