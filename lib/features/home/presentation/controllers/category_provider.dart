
import 'package:flutter/material.dart';
import 'package:wesaya/core/helpers/app_helper.dart';
import 'package:wesaya/features/home/data/repos/category_repo.dart';

import '../../data/models/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryRepo categoryRepo;

  CategoryProvider(
    this.categoryRepo,
  );

  List<CategoryModel> categories = [];

  bool loading = false;

  Future<void> getAllCategories() async {
    loading = true;
    notifyListeners();

    final response = await categoryRepo.getAllCategories();
    response.fold(
      (l) {},
      (r) {
        categories = r;
      },
    );

    loading = false;
    notifyListeners();
  }

  Future<void> deleteCategory(int id) async {
    if (id == -50) {
      return;
    }
    final index = categories.indexWhere(
      (element) => element.id == id,
    );

    final item = categories[index];

    categories.removeAt(
      index,
    );
    notifyListeners();

    final response = await categoryRepo.deleteCategory(
      id,
    );
    response.fold(
      (l) {
        categories.insert(
          index,
          item,
        );
        AppHelper.showDialogManager(
          l.msg,
        );
      },
      (r) {},
    );

    notifyListeners();
  }

  Future<void> addCategory(
    CategoryModel model,
  ) async {
    final index = categories.length;
    categories.add(
      model,
    );

    notifyListeners();

    final response = await categoryRepo.addCategory(
      model,
    );
    response.fold(
      (l) {
        categories.removeWhere(
          (element) => element.id == -50,
        );
        AppHelper.showDialogManager(
          l.msg,
        );
      },
      (r) {
        categories[index] = r;
      },
    );

    notifyListeners();
  }
}
