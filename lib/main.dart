import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/string_constants.dart';
import 'package:handbrake/features/home/cubit/home_cubit.dart';
import 'package:handbrake/routes/app_router.dart';
import 'package:handbrake/theme/app_theme.dart';
import 'package:handbrake/theme/theme_mode_cubit.dart';
import 'package:handbrake/utils/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpDependencyInjector();
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
        BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
      ],
      child: BlocBuilder<ThemeModeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp.router(
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
