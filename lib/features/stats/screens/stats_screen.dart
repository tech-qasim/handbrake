import 'package:auto_route/annotations.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/features/home/cubit/home_cubit.dart';
import 'package:handbrake/features/stats/cubit/stats_cubit.dart';
import 'package:handbrake/features/stats/widgets/history_widget.dart';

@RoutePage()
class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedDate = context.watch<StatsCubit>().state.selectedDate;
    final relapseHistory = context.watch<StatsCubit>().state.relapseHistory;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Stats', style: context.textTheme.displayLarge),
      ),

      body: Column(
        children: [
          EasyDateTimeLinePicker(
            focusedDate: selectedDate,
            firstDate: DateTime(2024, 3, 18),
            lastDate: DateTime(2030, 3, 18),
            onDateChange: (date) {
              // Handle the selected date.
              final monthYear = "${date.year}-${date.month}";
              context.read<StatsCubit>().getRelapseHistoryByMonth(monthYear);
              context.read<StatsCubit>().setSelectedDate(date);
            },
          ),

          Text(relapseHistory.length.toString()),
        ],
      ),
    );
  }
}
