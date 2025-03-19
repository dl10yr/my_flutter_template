import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_my_blueprint/routing/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {});

      return null;
    }, []);

    return MaterialApp.router(
      routerConfig: ref.watch(goRouterProvider),
      title: 'test',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
