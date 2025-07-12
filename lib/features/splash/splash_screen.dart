import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/constants/string_constants.dart';
import 'package:handbrake/routes/app_router.gr.dart';
import 'package:handbrake/theme/app_colors.dart';
import 'package:handbrake/utils/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      backgroundColor: AppColors.primaryColor,
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
          context.router.replace(const NavigationRoute());
        } else {
          context.router.replace(const IntroRoute());
        }
      },
      useImmersiveMode: false,
    );
  }
}
