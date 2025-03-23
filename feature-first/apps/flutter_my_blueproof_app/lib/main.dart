import 'package:flutter/material.dart';
import 'package:flutter_my_blueprint/core/custom_hooks/use_effect_once.dart';
import 'package:flutter_my_blueprint/core/themes/material_theme.dart';
import 'package:flutter_my_blueprint/core/themes/text_theme.dart';
import 'package:flutter_my_blueprint/routing/go_router_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffectOnce(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {});

      return null;
    });

    final textTheme = createTextTheme(context);

    return MaterialApp.router(
      routerConfig: ref.watch(goRouterProvider),
      title: 'test',
      theme: lightTheme(textTheme: textTheme),
      darkTheme: darkTheme(textTheme: textTheme),
    );
  }
}
