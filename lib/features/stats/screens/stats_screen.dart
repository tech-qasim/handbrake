import 'package:auto_route/annotations.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/constants/string_constants.dart';
import 'package:handbrake/features/home/cubit/home_cubit.dart';
import 'package:handbrake/features/stats/cubit/stats_cubit.dart';
import 'package:handbrake/theme/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';

@RoutePage()
class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeCubit>().setFirstRelapseDateTime();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final firstRelapseTime = context.watch<HomeCubit>().state.firstRelapseDate;
    final firstRelapse = DateTime(
      firstRelapseTime.year,
      firstRelapseTime.month,
      firstRelapseTime.day,
    );

    print('first relapse : $firstRelapse');
    final focusedDate = context.watch<StatsCubit>().state.focusedDate;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Stats', style: context.textTheme.displayLarge),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            TableCalendar(
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
              ),

              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                todayDecoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                todayTextStyle: context.textTheme.bodyMedium!.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
              calendarFormat: CalendarFormat.month,
              availableGestures: AvailableGestures.horizontalSwipe,
              focusedDay: focusedDate,
              firstDay: firstRelapse,
              lastDay: DateTime.now(),

              onPageChanged: (focusedDay) {
                print(focusedDay);
                // final date = "${focusedDay.year}-${focusedDay.month}";

                context.read<StatsCubit>().setFocusedDate(focusedDay);
                // context.read<StatsCubit>().getRelapseHistoryByMonth(date);
              },
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, day, events) {
                  if (day == firstRelapseTime.atStartOfDayUtc) {
                    return GestureDetector(
                      onTap: () {
                        context.showSnackBar(
                          'The day you decided to quit addiction',
                        );
                      },
                      child: Center(
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Image.asset(
                            AssetIcons.quitIcon,
                            scale: 4,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Center(child: Text(day.day.toString()));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
