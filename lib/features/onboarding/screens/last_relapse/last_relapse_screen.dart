import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/features/home/cubit/home_cubit.dart';
import 'package:handbrake/routes/app_router.gr.dart';
import 'package:handbrake/theme/app_colors.dart';
import 'package:handbrake/widgets/app_custom_button.dart';

@RoutePage()
class LastRelapseScreen extends StatelessWidget {
  const LastRelapseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final relapseDateTime = context.watch<HomeCubit>().state.lastRelapseDate;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Text(
                'When was your last relapse?',
                textAlign: TextAlign.center,
                style: context.textTheme.displayLarge?.copyWith(fontSize: 26),
              ),
              const SizedBox(height: 15),
              Text(
                'Knowing this helps us tailor your recovery plan and track your progress.',
                textAlign: TextAlign.center,
                style: context.textTheme.displayLarge?.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 40),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.datePickerBgColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  mode: CupertinoDatePickerMode.date,
                  showDayOfWeek: true,
                  onDateTimeChanged: (DateTime newDate) {
                    context.read<HomeCubit>().changeLastRelapseDate(newDate);
                  },
                ),
              ),

              const Spacer(),

              AppCustomButton(
                onPressed: () {
                  context.read<HomeCubit>().addRelapseOnOnboarding(
                    relapseDateTime,
                  );

                  context.router.replace(const NavigationRoute());
                },
                buttonText: 'Let\'s Go',
                isFullWidth: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
