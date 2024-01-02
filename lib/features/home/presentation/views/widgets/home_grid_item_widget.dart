import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wesaya/features/home/data/models/category_model.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../controllers/category_provider.dart';

class HomeGridItemWidget extends StatelessWidget {
  const HomeGridItemWidget({Key? key, required this.model}) : super(key: key);
  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(
            bottom: 10,
            right: 10,
            left: 10,
            top: 35,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: AppColors.mainColor,
            ),
            color: model.isActive ? AppColors.greenColor : AppColors.redColor,
          ),
          child: Text(
            model.name,
            style: const TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        IconButton(
          onPressed: () async {
            await context.read<CategoryProvider>().deleteCategory(
                  model.id,
                );
          },
          icon: const Icon(
            Icons.delete_outline,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}
