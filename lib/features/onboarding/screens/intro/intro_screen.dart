import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/constants/string_constants.dart';
import 'package:handbrake/routes/app_router.gr.dart';
import 'package:handbrake/widgets/app_custom_button.dart';

@RoutePage()
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Text(
                appName,
                style: context.textTheme.displayLarge?.copyWith(fontSize: 19),
              ),
              const SizedBox(height: 15),
              Text(
                'Welcome to $appName',
                style: context.textTheme.displayLarge?.copyWith(fontSize: 28),
              ),
              const SizedBox(height: 15),
              Text(
                'Your journey to freedom from porn addiction starts here. We\'re here to support you every step of the way.',
                textAlign: TextAlign.center,
                style: context.textTheme.displayLarge?.copyWith(fontSize: 16),
              ),
              const Spacer(),
              AppCustomButton(
                onPressed: () {
                  context.router.replace(const LastRelapseRoute());
                },
                buttonText: 'Get Started',
                isFullWidth: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
