import 'package:cores_core/widgets/button/cool_button.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CoolButton)
Widget buildCoolButtonUseCase(BuildContext context) {
  return CoolButton(
    text: 'aaaa',
    onPressed: () {
      //
    },
  );
}
