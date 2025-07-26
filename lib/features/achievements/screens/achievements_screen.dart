import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/constants/string_constants.dart';
import 'package:handbrake/features/achievements/widgets/achievement_card_widget.dart';
import 'package:handbrake/features/home/cubit/home_cubit.dart';

@RoutePage()
class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final soberDays = context.watch<HomeCubit>().state.soberTime.inSeconds;
    return Scaffold(
      appBar: AppBar(
        title: Text('Awards', style: context.textTheme.displayLarge),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        itemCount: awards.length,
        itemBuilder: (context, index) {
          final award = awards[index];
          return AchievementCardWidget(
            title: award.title,
            dayAchieved: soberDays,
            dayRequired: award.daysRequired * 24 * 60 * 60,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 10);
        },
      ),
    );
  }
}
