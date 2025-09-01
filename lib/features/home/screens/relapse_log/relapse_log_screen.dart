import 'package:auto_route/auto_route.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/constants/string_constants.dart';
import 'package:handbrake/features/home/cubit/home_cubit.dart';
import 'package:handbrake/features/home/widgets/multipe_choice_widget.dart';
import 'package:handbrake/theme/app_colors.dart';
import 'package:handbrake/widgets/app_custom_button.dart';

@RoutePage()
class RelapseLogScreen extends StatefulWidget {
  const RelapseLogScreen({super.key});

  @override
  State<RelapseLogScreen> createState() => _RelapseLogScreenState();
}

class _RelapseLogScreenState extends State<RelapseLogScreen> {
  final TextEditingController actionController = TextEditingController();
  final TextEditingController triggerController = TextEditingController();
  final pageController = PageController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeCubit>().resetRelapseLog();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedTriggerChip = context
        .watch<HomeCubit>()
        .state
        .selectedTriggerChip;

    final selectedEmotionChip = context
        .watch<HomeCubit>()
        .state
        .selectedEmotionChip;

    final triggers = context.watch<HomeCubit>().state.triggers;

    final onboardingIndex = context.watch<HomeCubit>().state.onboardingIndex;

    final urgeIntensity = context.watch<HomeCubit>().state.urgeIntensity;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            context.router.maybePop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DotsIndicator(
                dotsCount: 5,
                position: onboardingIndex.toDouble(),
                animate: true,
              ),
            ],
          ),
          15.height,
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (int index) {
                context.read<HomeCubit>().setOnboardingIndex(index);
              },
              children: [
                MultipeChoiceWidget(
                  questionText: 'When did it happen?',
                  questionTag: 'relapseTime',
                  pageController: pageController,
                  options: ['Morning', 'Afternoon', 'Evening', 'Night'],
                ),
                MultipeChoiceWidget(
                  questionText: 'What triggered the relapse?',
                  questionTag: 'trigger',
                  pageController: pageController,
                  options: triggers,
                  customOption: Material(
                    child: ListTile(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: AppColors.whiteColor,
                              title: const Text('Add New Trigger'),
                              content: TextField(
                                controller: triggerController,
                                decoration: const InputDecoration(
                                  hintText: 'Enter trigger',
                                ),
                                autofocus: true,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    final newTrigger = triggerController.text
                                        .trim();
                                    if (newTrigger.isNotEmpty) {
                                      context.read<HomeCubit>().addNewTrigger(
                                        newTrigger,
                                      );
                                      // Navigator.of(context).pop();
                                    }
                                  },
                                  child: const Text('Add'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      title: Row(
                        children: [
                          const Icon(Icons.add, color: AppColors.whiteColor),
                          10.width,
                          Text(
                            'Add Triggers',
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 27,
                      ),
                      horizontalTitleGap: 12,
                      tileColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: AppColors.statsCardBorderColor,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),

                MultipeChoiceWidget(
                  questionTag: 'resist',
                  questionText: 'Did you try to resist the urge?',
                  pageController: pageController,
                  options: ['Yes', 'No'],
                ),
                MultipeChoiceWidget(
                  questionTag: 'doing',
                  questionText: 'What were you doing before the urge started?',
                  pageController: pageController,
                  customOption: Material(
                    child: ListTile(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: AppColors.whiteColor,
                              title: const Text('Add New Action'),
                              content: TextField(
                                controller: actionController,
                                decoration: const InputDecoration(
                                  hintText: 'Enter Action',
                                ),
                                autofocus: true,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    final newTrigger = actionController.text
                                        .trim();
                                    if (newTrigger.isNotEmpty) {
                                      context.read<HomeCubit>().addNewAction(
                                        newTrigger,
                                      );
                                      // Navigator.of(context).pop();
                                    }
                                  },
                                  child: const Text('Add'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      title: Row(
                        children: [
                          const Icon(Icons.add, color: AppColors.whiteColor),
                          10.width,
                          Text(
                            'Add new action',
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 27,
                      ),
                      horizontalTitleGap: 12,
                      tileColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: AppColors.statsCardBorderColor,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  options: [
                    'Scrolling social media',
                    'Watching TV',
                    'Studying',
                    'Working',
                  ],
                ),

                MultipeChoiceWidget(
                  questionTag: 'intensity',
                  questionText: 'What was the intensity of the urge?',
                  pageController: pageController,
                  options: [],
                  isLastPage: true,
                  customOption: SizedBox(
                    width: double.infinity,
                    child: Slider(
                      padding: EdgeInsets.zero,
                      value: urgeIntensity,
                      max: 10,
                      min: 1,
                      divisions: 9,
                      label: urgeIntensity.round().toString(),
                      onChanged: (double value) {
                        context.read<HomeCubit>().setUrgeIntensity(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Text(
          //   'Triggers',
          //   style: context.textTheme.displayLarge?.copyWith(
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // const SizedBox(height: 15),
          // Wrap(
          //   spacing: 10,
          //   children: [
          //     ...triggers.map((option) {
          //       return ChoiceChip(
          //         showCheckmark: false,
          //         label: Text(option),
          //         selected: selectedTriggerChip == option,
          //         onSelected: (bool selected) {
          //           if (selected) {
          //             context.read<HomeCubit>().setTriggerChip(option);
          //           }
          //         },
          //       );
          //     }),
          //     GestureDetector(
          //       onTap: () {
          //         showDialog(
          //           context: context,
          //           builder: (context) {
          //             final TextEditingController triggerController =
          //                 TextEditingController();
          //             return AlertDialog(
          //               backgroundColor: AppColors.whiteColor,
          //               title: const Text('Add New Trigger'),
          //               content: TextField(
          //                 controller: triggerController,
          //                 decoration: const InputDecoration(
          //                   hintText: 'Enter trigger',
          //                 ),
          //                 autofocus: true,
          //               ),
          //               actions: [
          //                 TextButton(
          //                   onPressed: () {
          //                     Navigator.of(context).pop();
          //                   },
          //                   child: const Text('Cancel'),
          //                 ),
          //                 TextButton(
          //                   onPressed: () {
          //                     final newTrigger = triggerController.text
          //                         .trim();
          //                     if (newTrigger.isNotEmpty) {
          //                       context.read<HomeCubit>().addNewTrigger(
          //                         newTrigger,
          //                       );
          //                       // Navigator.of(context).pop();
          //                     }
          //                   },
          //                   child: const Text('Add'),
          //                 ),
          //               ],
          //             );
          //           },
          //         );
          //       },
          //       child: Chip(
          //         side: const BorderSide(color: AppColors.whiteColor),
          //         backgroundColor: AppColors.primaryColor,
          //         label: Row(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             const Icon(
          //               Icons.add,
          //               size: 18,
          //               color: AppColors.whiteColor,
          //             ),
          //             const SizedBox(width: 2),
          //             Text(
          //               'Add',
          //               style: context.textTheme.bodyMedium?.copyWith(
          //                 color: AppColors.whiteColor,
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 20),
          // Text(
          //   'How do you feel?',
          //   style: context.textTheme.displayLarge?.copyWith(
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // const SizedBox(height: 15),
          // Wrap(
          //   spacing: 10,
          //   children: emotions.map((option) {
          //     return ChoiceChip(
          //       showCheckmark: false,
          //       label: Text(option),
          //       selected: selectedEmotionChip == option,
          //       onSelected: (bool selected) {
          //         if (selected) {
          //           context.read<HomeCubit>().setEmotionChip(option);
          //         } else {
          //           null;
          //         }
          //       },
          //     );
          //   }).toList(),
          // ),
          // const SizedBox(height: 20),
          // Text(
          //   'Urge Intensity',
          //   style: context.textTheme.displayLarge?.copyWith(
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // const SizedBox(height: 20),
          // SizedBox(
          //   width: double.infinity,
          //   child: Slider(
          //     padding: EdgeInsets.zero,
          //     value: urgeIntensity,
          //     max: 10,
          //     min: 1,
          //     divisions: 9,
          //     label: urgeIntensity.round().toString(),
          //     onChanged: (double value) {
          //       context.read<HomeCubit>().setUrgeIntensity(value);
          //     },
          //   ),
          // ),

          // const SizedBox(height: 20),

          // AppCustomButton(
          //   isFullWidth: true,
          //   onPressed:
          //       selectedEmotionChip != null && selectedTriggerChip != null
          //       ? () {
          //           context.read<HomeCubit>().addRelapse(
          //             DateTime.now(),
          //             selectedTriggerChip,
          //             selectedEmotionChip,
          //             urgeIntensity,
          //           );

          //           context.read<HomeCubit>().setLastRelapseDate(
          //             DateTime.now(),
          //           );

          //           context.read<HomeCubit>().getLongestStreak();
          //           context.router.maybePop();
          //         }
          //       : null,
          //   buttonColor:
          //       selectedEmotionChip != null && selectedTriggerChip != null
          //       ? AppColors.primaryColor
          //       : Colors.blueGrey,
          //   buttonText: 'Save & Reset Counter',
          // ),
        ],
      ),
    );
  }
}
