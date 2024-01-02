import 'package:flutter/material.dart';
import 'package:wesaya/main.dart';

import '../utils/enums.dart';
import '../widgets/global_dialog_widget.dart';

abstract class AppHelper {
  static showDialogManager(
    String message, {
    DialogType type = DialogType.error,
    Function()? fun,
    Widget child = const SizedBox(),
  }) {
    showDialog(
      context: MyApp.navigatorKey.currentContext!,
      builder: (ctx) => GlobalDialogWidget(
        message: message,
        type: type,
        child: child,
      ),
    ).then((value) {
      if (fun != null) {
        fun();
      }
    });
  }
}
