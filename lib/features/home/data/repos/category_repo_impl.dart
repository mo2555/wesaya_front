import 'package:dartz/dartz.dart';
import 'package:wesaya/core/api/api_call_model.dart';
import 'package:wesaya/core/api/api_errors.dart';
import 'package:wesaya/core/api/api_service.dart';
import 'package:wesaya/core/utils/end_points.dart';
import 'package:wesaya/core/utils/enums.dart';

import '../models/category_model.dart';
import 'category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  ApiService apiService;

  CategoryRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<CategoryModel>>> getAllCategories() async {
    try {
      final response = await apiService.apiCall(
        model: ApiCallModel(
          type: ApiCallType.get,
          endPoint: EndPoints.categories,
        ),
      );
      List<CategoryModel> data = [];
      response['data'].forEach((item) {
        data.add(
          CategoryModel.fromJson(
            item ?? {},
          ),
        );
      });

      return right(
        data,
      );
    } catch (e) {
      return left(
        ServerFailure.generalException(e),
      );
    }
  }

  @override
  Future<Either<Failure, CategoryModel>> deleteCategory(int id) async {
    try {
      final response = await apiService.apiCall(
        model: ApiCallModel(
          type: ApiCallType.delete,
          endPoint: '${EndPoints.categories}/$id',
        ),
      );

      return right(
        CategoryModel.fromJson(
          response['data'] ?? {},
        ),
      );
    } catch (e) {
      return left(
        ServerFailure.generalException(e),
      );
    }
  }

  @override
  Future<Either<Failure, CategoryModel>> addCategory(
      CategoryModel model) async {
    try {
      final response = await apiService.apiCall(
        model: ApiCallModel(
          type: ApiCallType.post,
          endPoint: EndPoints.categories,
          body: model.toJson(),
        ),
      );

      return right(
        CategoryModel.fromJson(
          response['data'] ?? {},
        ),
      );
    } catch (e) {
      return left(
        ServerFailure.generalException(e),
      );
    }
  }
}
