import 'package:flutter/material.dart';
import 'package:flutter_my_blueprint/core/custom_hooks/use_effect_once.dart';
import 'package:flutter_my_blueprint/core/data/service/shared_preference/app_shared_prefernce_key.dart';
import 'package:flutter_my_blueprint/core/extension/enum_extension.dart';
import 'package:flutter_my_blueprint/core/themes/material_theme.dart';
import 'package:flutter_my_blueprint/core/themes/text_theme.dart';
import 'package:flutter_my_blueprint/core/ui/theme_mode/provider/init_theme_mode.dart';
import 'package:flutter_my_blueprint/core/ui/theme_mode/provider/theme_mode_notifier.dart';
import 'package:flutter_my_blueprint/routing/go_router_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeMode = await SharedPreferencesAsync().getString(
    AppSharedPreferenceKey.themeMode.keyName,
  );

  final overrideProviders = [
    initThemeModeProvider.overrideWithValue(
      ThemeMode.values.byNameOrNull(themeMode) ?? ThemeMode.system,
    ),
  ];

  runApp(
    ProviderScope(overrides: [...overrideProviders], child: const MyApp()),
  );
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
      themeMode: ref.watch(themeModeNotifierProvider),
    );
  }
}
