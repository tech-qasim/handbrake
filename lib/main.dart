import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:handbrake/constants/string_constants.dart';
import 'package:handbrake/features/home/cubit/home_cubit.dart';
import 'package:handbrake/features/journal/cubit/journal_cubit.dart';
import 'package:handbrake/features/settings/cubit/settings_cubit.dart';
import 'package:handbrake/features/stats/cubit/stats_cubit.dart';
import 'package:handbrake/routes/app_router.dart';
import 'package:handbrake/services/notification_service.dart';
import 'package:handbrake/theme/app_theme.dart';
import 'package:handbrake/theme/theme_mode_cubit.dart';
import 'package:handbrake/utils/di.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpDependencyInjector();
  final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation(currentTimeZone));
  await getIt<NotificationService>().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeModeCubit>(create: (context) => ThemeModeCubit()),
        BlocProvider<StatsCubit>(create: (context) => StatsCubit()),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(context.read<StatsCubit>()),
        ),
        BlocProvider<JournalCubit>(create: (context) => JournalCubit()),
        BlocProvider<SettingsCubit>(
          create: (context) => SettingsCubit(getIt<SharedPreferences>()),
        ),
      ],
      child: BlocBuilder<ThemeModeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: appName,
            theme: state == ThemeMode.light
                ? AppTheme.lightTheme
                : AppTheme.darkTheme,
            routerConfig: appRouter.config(),
          );
        },
      ),
    );
  }
}
