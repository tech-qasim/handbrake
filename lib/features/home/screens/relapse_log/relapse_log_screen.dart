import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/constants/string_constants.dart';
import 'package:handbrake/features/home/cubit/home_cubit.dart';
import 'package:handbrake/theme/app_colors.dart';
import 'package:handbrake/widgets/app_custom_button.dart';
import 'package:handbrake/widgets/app_textfield.dart';

@RoutePage()
class RelapseLogScreen extends StatefulWidget {
  const RelapseLogScreen({super.key});

  @override
  State<RelapseLogScreen> createState() => _RelapseLogScreenState();
}

class _RelapseLogScreenState extends State<RelapseLogScreen> {
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
        title: Text('Relapse Log', style: context.textTheme.displayLarge),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Triggers',
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 10,
              children: triggers.map((option) {
                return ChoiceChip(
                  showCheckmark: false,
                  label: Text(option),
                  selected: selectedTriggerChip == option,
                  onSelected: (bool selected) {
                    if (selected) {
                      context.read<HomeCubit>().setTriggerChip(option);
                    } else {
                      null;
                    }
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Text(
              'How do you feel?',
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 10,
              children: emotions.map((option) {
                return ChoiceChip(
                  showCheckmark: false,
                  label: Text(option),
                  selected: selectedEmotionChip == option,
                  onSelected: (bool selected) {
                    if (selected) {
                      context.read<HomeCubit>().setEmotionChip(option);
                    } else {
                      null;
                    }
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Text(
              'Urge Intensity',
              style: context.textTheme.displayLarge?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
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

            const SizedBox(height: 20),

            const AppTextField(
              hintText: 'Reflect on what happened',
              minLines: 4,
              lines: 20,
            ),

            const SizedBox(height: 30),

            AppCustomButton(
              isFullWidth: true,
              onPressed:
                  selectedEmotionChip != null && selectedTriggerChip != null
                  ? () {
                      context.read<HomeCubit>().addRelapse(
                        DateTime.now(),
                        selectedTriggerChip,
                        selectedEmotionChip,
                        urgeIntensity,
                      );

                      context.read<HomeCubit>().setLastRelapseDateTime();
                      context.router.maybePop();
                    }
                  : null,
              buttonColor:
                  selectedEmotionChip != null && selectedTriggerChip != null
                  ? AppColors.primaryColor
                  : Colors.blueGrey,
              buttonText: 'Save & Reset Counter',
            ),
          ],
        ),
      ),
    );
  }
}
