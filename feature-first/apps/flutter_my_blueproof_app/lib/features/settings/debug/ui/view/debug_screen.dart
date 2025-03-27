import 'package:flutter/material.dart';
import 'package:flutter_my_blueprint/core/provider/package_info.dart';
import 'package:flutter_my_blueprint/core/widgets/loading_indicator/app_loading_indicator_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DebugScreen extends ConsumerWidget {
  const DebugScreen({super.key});

  Widget _infoTile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle.isEmpty ? 'Not set' : subtitle),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.watch(packageInfoProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Debug Information')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('loading'),
            onTap: () async {
              final rrr = await ref
                  .read(appLoadingIndicatorNotifierProvider.notifier)
                  .show(() async {
                    await Future.delayed(const Duration(seconds: 2));
                    return 'aaa';
                  });
              if (rrr == 'aaa') {}
            },
          ),
          _infoTile('App name', packageInfo.appName),
          _infoTile('Package name', packageInfo.packageName),
          _infoTile('App version', packageInfo.version),
          _infoTile('Build number', packageInfo.buildNumber),
          _infoTile('Build signature', packageInfo.buildSignature),
          if (packageInfo.installerStore != null)
            _infoTile('Installer store', packageInfo.installerStore!),
          const Divider(),
          _infoTile('Platform', Theme.of(context).platform.toString()),
          _infoTile(
            'Device Pixel Ratio',
            MediaQuery.of(context).devicePixelRatio.toStringAsFixed(2),
          ),
          _infoTile(
            'Screen size',
            '${MediaQuery.of(context).size.width.toStringAsFixed(1)} x ${MediaQuery.of(context).size.height.toStringAsFixed(1)}',
          ),
        ],
      ),
    );
  }
}
