import 'package:flutter/material.dart';

import 'add_dialog_widget.dart';

class FloatingButtonWidget extends StatelessWidget {
  const FloatingButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) => const AddDialogWidget(),
        );
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
