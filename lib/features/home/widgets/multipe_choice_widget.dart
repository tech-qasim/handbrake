import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/features/home/cubit/home_cubit.dart';
import 'package:handbrake/theme/app_colors.dart';
import 'package:handbrake/widgets/app_custom_button.dart';

class MultipeChoiceWidget extends StatelessWidget {
  const MultipeChoiceWidget({
    super.key,
    required this.questionTag,
    required this.questionText,
    required this.pageController,
    this.isMultipleChoice = false,
    required this.options,
    this.customWidget,
    this.customOption,
    this.isLastPage = false,
  });

  final String questionTag;
  final String questionText;
  final PageController pageController;
  final bool isMultipleChoice;
  final List<String> options;
  final Widget? customWidget;
  final Widget? customOption;
  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    final relapseTime = context.watch<HomeCubit>().state.relapseTime;
    final isResistUrge = context.watch<HomeCubit>().state.isResistUrge;
    final urgeIntensity = context.watch<HomeCubit>().state.urgeIntensity;
    final urgeStartedReason = context
        .watch<HomeCubit>()
        .state
        .urgeStartedReasons;
    final selectedTrigger = context
        .watch<HomeCubit>()
        .state
        .selectedTriggerChip;
    final onboardingIndex = context.watch<HomeCubit>().state.onboardingIndex;
    return customWidget ??
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                questionText,
                style: context.textTheme.displayLarge?.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              20.height,

              if (options.isNotEmpty)
                ...options.map((option) {
                  bool isSelected;

                  if (questionTag == 'relapseTime') {
                    isSelected = relapseTime == option;
                  } else if (questionTag == 'trigger') {
                    isSelected = selectedTrigger == option;
                  } else if (questionTag == 'resist') {
                    isSelected = isResistUrge == option;
                  } else {
                    isSelected = urgeStartedReason == option;
                  }

                  return GestureDetector(
                    onTap: () {
                      if (questionTag == 'relapseTime') {
                        context.read<HomeCubit>().setRelapseTime(option);
                      } else if (questionTag == 'trigger') {
                        context.read<HomeCubit>().setTriggerChip(option);
                      } else if (questionTag == 'resist') {
                        context.read<HomeCubit>().setResistUrge(option);
                      } else {
                        context.read<HomeCubit>().setUrgeStartedReason(option);
                      }
                    },
                    child: Column(
                      children: [
                        Material(
                          child: ListTile(
                            title: Text(
                              option,
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? AppColors.whiteColor
                                    : AppColors.blackColor,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 27,
                            ),
                            horizontalTitleGap: 12,
                            tileColor: isSelected
                                ? AppColors.primaryColor
                                : AppColors.transparentColor,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                color: AppColors.statsCardBorderColor,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        13.height,
                      ],
                    ),
                  );
                }),

              ?customOption,

              // const Spacer(),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppCustomButton(
                    buttonColor: AppColors.awardSubtitleColor,
                    onPressed: () {
                      pageController.animateToPage(
                        onboardingIndex - 1,
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.easeInOut,
                      );
                    },
                    buttonText: 'Back',
                  ),
                  AppCustomButton(
                    onPressed: () {
                      if (onboardingIndex == 0 && relapseTime == '') {
                        context.showSnackBar('Please, select an option');
                        return;
                      } else if (onboardingIndex == 1 &&
                          selectedTrigger == '') {
                        context.showSnackBar('Please select an option');
                        return;
                      } else if (onboardingIndex == 2 && isResistUrge == '') {
                        context.showSnackBar('Please select an option');
                        return;
                      } else if (onboardingIndex == 3 &&
                          urgeStartedReason == '') {
                        context.showSnackBar('Please select an option');
                        return;
                      }

                      if (isLastPage) {
                        context.read<HomeCubit>().addRelapse(
                          DateTime.now(),
                          relapseTime,
                          selectedTrigger ?? '',
                          isResistUrge,
                          urgeStartedReason,
                          urgeIntensity,
                        );

                        context.read<HomeCubit>().setLastRelapseDate(
                          DateTime.now(),
                        );

                        context.read<HomeCubit>().getLongestStreak();

                        context.router.maybePop();
                      }

                      pageController.animateToPage(
                        onboardingIndex + 1,
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.easeInOut,
                      );
                    },
                    buttonText: 'Next',
                  ),
                ],
              ),
            ],
          ),
        );
  }
}
