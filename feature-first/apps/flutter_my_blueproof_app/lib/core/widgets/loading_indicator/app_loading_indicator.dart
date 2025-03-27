import 'package:flutter/material.dart';
import 'package:flutter_my_blueprint/core/widgets/loading_indicator/app_loading_indicator_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
