import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlutterBranchPasteControlButton extends StatelessWidget {
  const FlutterBranchPasteControlButton({super.key});

  @override
  Widget build(BuildContext context) {
    const String viewType = 'branch-platform-view';

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 40, maxWidth: 80),
      child: _buildButton(context, viewType: viewType),
    );
  }

  Widget _buildButton(BuildContext context, {required String viewType}) {
    if (Platform.isIOS) {
      return UiKitView(
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParamsCodec: const StandardMessageCodec(),
        creationParams: <String, dynamic>{},
      );
    } else {
      return Container();
    }
  }
}
