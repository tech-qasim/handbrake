import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/theme/app_colors.dart';

class AchievementCardWidget extends StatelessWidget {
  const AchievementCardWidget({
    super.key,
    required this.title,
    required this.dayAchieved,
    required this.dayRequired,
  });

  final String title;
  final int dayAchieved;
  final int dayRequired;

  Color _getProgressColor(double percentage) {
    if (percentage < 50) {
      return AppColors.progressBarLowColor;
    } else if (percentage < 80) {
      return AppColors.progressBarMediumColor;
    } else {
      return AppColors.progressBarHighColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final int clampedElapsed = dayAchieved.clamp(0, dayRequired);
    final double percentage = (clampedElapsed / dayRequired) * 100;
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.textTheme.bodyMedium?.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 3),
            Text(
              'Stay clean for $dayRequired days',
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 13,
                color: AppColors.awardSubtitleColor,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 10,
              child: LinearProgressIndicator(
                color: _getProgressColor(percentage),
                backgroundColor: AppColors.textfieldBgColor,
                value: dayAchieved / dayRequired,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            const SizedBox(height: 10),
            if (dayAchieved >= dayRequired)
              const Center(child: Text('Achieved!'))
            else
              Center(child: Text('${percentage.toInt()}% completed')),
          ],
        ),
      ),
    );
  }
}
