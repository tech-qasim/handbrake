import 'package:get_it/get_it.dart';
import 'package:handbrake/local_db/app_database.dart';
import 'package:handbrake/services/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

Future<void> setUpDependencyInjector() async {
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<NotificationService>(() => NotificationService());
}
