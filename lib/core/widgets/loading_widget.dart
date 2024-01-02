import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    this.color = AppColors.whiteColor,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color,
    );
  }
}
