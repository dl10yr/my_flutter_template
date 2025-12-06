import 'package:flutter/material.dart';

abstract class BottomSheetListItem {
  String get name;
}

/// Shows a bottom sheet with a list of items.
///
/// [context] is the build context.
/// [items] is the list of items to display.
Future<int?> showListBottomSheet<T>({
  required BuildContext context,
  required List<T> items,
}) async {
  return showModalBottomSheet<int>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) => Column(
      mainAxisSize: .min,
      children: [
        const Divider(height: 1),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(item.toString()),
                onTap: () {
                  Navigator.of(context).pop(index);
                },
              );
            },
          ),
        ),
      ],
    ),
  );
}
