import 'package:cores_core/custom_hooks/use_effect_once.dart';
import 'package:cores_core/data/service/shared_preference/app_shared_prefernce_key.dart';
import 'package:cores_core/exception/provider/app_exception_notifier.dart';
import 'package:cores_core/extension/enum_extension.dart';
import 'package:cores_core/logger/logger.dart';
import 'package:cores_core/provider/app_lifecycle_notifier.dart';
import 'package:cores_core/provider/package_info.dart';
import 'package:cores_core/themes/material_theme.dart';
import 'package:cores_core/themes/text_theme.dart';
import 'package:cores_core/ui/theme_mode/provider/init_theme_mode.dart';
import 'package:cores_core/ui/theme_mode/provider/theme_mode_notifier.dart';
import 'package:cores_core/widgets/loading_indicator/app_loading_indicator.dart';
import 'package:cores_core/widgets/snack_bar/app_snack_bar_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/routing/go_router_provider.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeMode = await SharedPreferencesAsync().getString(
    AppSharedPreferenceKey.themeMode.keyName,
  );
  final packageInfo = await PackageInfo.fromPlatform();

  final overrideProviders = [
    initThemeModeProvider.overrideWithValue(
      ThemeMode.values.byNameOrNull(themeMode) ?? ThemeMode.system,
    ),
    packageInfoProvider.overrideWithValue(packageInfo),
  ];

  runApp(
    ProviderScope(
      overrides: [...overrideProviders],
      child: const MyApp(),
    ),
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

    ref
      ..listen(appLifecycleNotifierProvider, (_, newState) {
        switch (newState) {
          case AppLifecycleState.resumed:
            logger.d('AppLifecycleState.resumed');
          case AppLifecycleState.inactive:
            logger.d('AppLifecycleState.inactive');
          case AppLifecycleState.paused:
            logger.d('AppLifecycleState.paused');
          case AppLifecycleState.detached:
            logger.d('AppLifecycleState.detached');
          case AppLifecycleState.hidden:
            logger.d('AppLifecycleState.hidden');
        }
      })
      ..listen(appExceptionNotifierProvider, (previous, next) {
        if (next != null) {
          ref.read(appExceptionNotifierProvider.notifier).consume();
          AppSnackBarManager.showErrorSnackBar(
            context: context,
            message: next.message,
          );
        }
      });

    final textTheme = createTextTheme(context);

    return MaterialApp.router(
      routerConfig: ref.watch(goRouterProvider),
      builder: (context, child) {
        return Stack(
          children: [
            Positioned.fill(child: child!),
            const Positioned.fill(child: AppLoadingIndicator()),
          ],
        );
      },
      title: 'test',
      supportedLocales: const [Locale('ja', 'JP')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      theme: lightTheme(textTheme: textTheme),
      darkTheme: darkTheme(textTheme: textTheme),
      themeMode: ref.watch(themeModeNotifierProvider),
      scaffoldMessengerKey: AppSnackBarManager.scaffoldMessengerKey,
    );
  }
}
