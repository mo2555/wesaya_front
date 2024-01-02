import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wesaya/features/home/presentation/views/widgets/home_grid_item_widget.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/empty_widget.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../controllers/category_provider.dart';

class HomeGridWidget extends StatelessWidget {
  const HomeGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, provider, _) {
        return provider.categories.isNotEmpty
            ? GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 12,
                ),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (ctx, index) => HomeGridItemWidget(
                  model: provider.categories[index],
                ),
                itemCount: provider.categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
              )
            : Center(
                child: provider.loading
                    ? const LoadingWidget(
                        color: AppColors.mainColor,
                      )
                    : const EmptyWidget(),
              );
      },
    );
  }
}
