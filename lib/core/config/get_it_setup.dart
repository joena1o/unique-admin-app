import 'package:get_it/get_it.dart';
import 'package:unique_admin_application/data/repository/auth_repository.dart';
import 'package:unique_admin_application/data/repository/product_repository.dart';
import 'package:unique_admin_application/utils/dialog_services.dart';

final GetIt getIt = GetIt.instance;

void setUpLocator() {
  getIt.registerLazySingleton<DialogServices>(() => DialogServices());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository());
  getIt.registerLazySingleton<ProductRepository>(() => ProductRepository());
}
