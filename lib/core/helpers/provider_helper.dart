import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:wesaya/core/di/di.dart';

import '../../features/home/data/repos/category_repo.dart';
import '../../features/home/presentation/controllers/category_provider.dart';

abstract class ProviderHelper {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider.value(
      value: CategoryProvider(
        getIt.get<CategoryRepo>(),
      ),
    ),
  ];
}
