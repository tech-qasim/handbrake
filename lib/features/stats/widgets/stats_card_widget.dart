import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/features/stats/cubit/stats_cubit.dart';
import 'package:handbrake/theme/app_colors.dart';

class StatsCardWidget extends StatelessWidget {
  const StatsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final focusedDate = context.watch<StatsCubit>().state.focusedDate;

    final focusedDateMonthYear = "${focusedDate.year}-${focusedDate.month}";

    final relapseCount =
        context
            .watch<StatsCubit>()
            .state
            .relapseHistoryMap[focusedDateMonthYear]
            ?.length ??
        0;

    return SizedBox(
      width: double.infinity,

      child: Card(
        color: AppColors.lightModeScreenBgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: AppColors.statsCardBorderColor),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Relapses on ${focusedDate.toMonthYear()}',
                style: context.textTheme.bodyMedium?.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                relapseCount.toString(),
                style: context.textTheme.bodyMedium?.copyWith(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
