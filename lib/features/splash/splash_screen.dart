import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/constants/string_constants.dart';
import 'package:handbrake/features/home/cubit/home_cubit.dart';
import 'package:handbrake/routes/app_router.gr.dart';
import 'package:handbrake/theme/app_colors.dart';
import 'package:handbrake/utils/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: AppColors.whiteColor,
      childWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 230,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    appName,
                    style: context.textTheme.displayLarge?.copyWith(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      asyncNavigationCallback: () async {
        final isUserOnboarded = getIt<SharedPreferences>().getBool(
          SharedPrefStrings.isUserOnboarded,
        );

        if (isUserOnboarded ?? false) {
          context.read<HomeCubit>().initializeTimer();
          Future.delayed(const Duration(seconds: 2)).then((_) {
            if (context.mounted) {
              context.router.replace(const NavigationRoute());
            }
          });
        } else {
          Future.delayed(const Duration(seconds: 2)).then((_) {
            if (context.mounted) {
              context.router.replace(const IntroRoute());
            }
          });
        }
      },
      useImmersiveMode: false,
    );
  }
}
