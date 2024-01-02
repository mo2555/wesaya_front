import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wesaya/features/home/presentation/controllers/category_provider.dart';
import 'package:wesaya/features/home/presentation/views/widgets/home_grid_widget.dart';

import 'widgets/app_bar_widget.dart';
import 'widgets/floating_button_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<CategoryProvider>().getAllCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(),
      body: HomeGridWidget(),
      floatingActionButton: FloatingButtonWidget(),
    );
  }
}
