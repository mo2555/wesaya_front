import 'package:get_it/get_it.dart';
import 'package:wesaya/features/home/data/repos/category_repo.dart';
import 'package:wesaya/features/home/data/repos/category_repo_impl.dart';

import '../api/api_service.dart';

GetIt getIt = GetIt.instance;

setUp() {
  getIt.registerSingleton<ApiService>(
    ApiService(),
  );
  getIt.registerSingleton<CategoryRepo>(
    CategoryRepoImpl(
      getIt.get<ApiService>(),
    ),
  );
}
