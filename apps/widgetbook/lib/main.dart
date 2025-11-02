import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: ThemeData(primarySwatch: Colors.blue),
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: ThemeData(primarySwatch: Colors.blue),
            ),
          ],
        ),
        ViewportAddon([
          IosViewports.iPhoneSE,
          IosViewports.iPhone13,
          IosViewports.iPad,
          AndroidViewports.samsungGalaxyS20,
        ]),
        InspectorAddon(enabled: true),
        LocalizationAddon(
          locales: [const Locale('en', 'US'), const Locale('ja', 'JP')],
          localizationsDelegates: [
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
          ],
        ),
        BuilderAddon(
          name: 'Scaffold',
          builder: (context, child) {
            // ref: https://github.com/yumemi-inc/flutter-mobile-project-template/blob/main/apps/catalog/lib/main.dart
            bool searchScaffold(Element element, int depth) {
              // 現在のWidgetbookは最上位近くにScaffoldがあるため、それを除外するためにdepthを比較している
              final hasScaffold = depth > 1 && element.widget is Scaffold;
              if (hasScaffold) {
                return true;
              }

              var hasScaffoldInChildren = false;
              // 子要素を走査
              element.visitChildren((child) {
                if (!hasScaffoldInChildren) {
                  hasScaffoldInChildren = searchScaffold(child, depth + 1);
                }
              });

              return hasScaffoldInChildren;
            }

            // 走査開始
            final element = context as Element;
            final hasScaffold = searchScaffold(element, 0);

            return hasScaffold ? child : Scaffold(body: child);
          },
        ),
        BuilderAddon(
          name: 'SafeArea',
          builder: (context, child) => SafeArea(child: child),
        ),
        AlignmentAddon(),
        TextScaleAddon(),
      ],
    );
  }
}
