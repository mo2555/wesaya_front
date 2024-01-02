import 'package:flutter/material.dart';
import 'package:wesaya/core/utils/extensions.dart';

import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/enums.dart';

class GlobalDialogWidget extends StatelessWidget {
  const GlobalDialogWidget(
      {Key? key,
      required this.type,
      required this.message,
      required this.child})
      : super(key: key);
  final DialogType type;
  final String message;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              type == DialogType.error ? AppImages.error : AppImages.success,
              height: 60,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              message,
              style: const TextStyle(
                color: AppColors.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            child,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Text(
                    'Ok',
                    style: TextStyle(
                      color: type == DialogType.sad
                          ? Colors.grey
                          : AppColors.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
