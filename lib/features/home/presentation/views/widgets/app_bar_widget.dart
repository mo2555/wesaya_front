import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      title: const Text(
        AppConstants.appName,
        style: TextStyle(
          color: AppColors.mainColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(
        double.infinity,
        kToolbarHeight,
      );
}
