import 'package:dartz/dartz.dart';
import 'package:wesaya/core/api/api_errors.dart';

import '../models/category_model.dart';

abstract class CategoryRepo {
  Future<Either<Failure, List<CategoryModel>>> getAllCategories();

  Future<Either<Failure, CategoryModel>> deleteCategory(int id);

  Future<Either<Failure, CategoryModel>> addCategory(CategoryModel model);
}
