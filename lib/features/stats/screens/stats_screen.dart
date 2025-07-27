import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/constants/string_constants.dart';
import 'package:handbrake/features/home/cubit/home_cubit.dart';
import 'package:handbrake/features/stats/cubit/stats_cubit.dart';
import 'package:handbrake/features/stats/widgets/stats_card_widget.dart';
import 'package:handbrake/routes/app_router.gr.dart';
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
    final date = "${DateTime.now().year}-${DateTime.now().month}";
    context.read<StatsCubit>().getRelapseHistoryByMonth(date);
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
    final focusedDate = context.watch<StatsCubit>().state.focusedDate;

    final focusedDateMonthYear = "${focusedDate.year}-${focusedDate.month}";

    final relapseHistoryMap = context
        .watch<StatsCubit>()
        .state
        .relapseHistoryMap;

    final relapseCount =
        context
            .watch<StatsCubit>()
            .state
            .relapseHistoryMap[focusedDateMonthYear]
            ?.length ??
        0;

    final longestStreak = context
        .watch<HomeCubit>()
        .state
        .longestStreakinSeconds;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Stats', style: context.textTheme.displayLarge),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatsCardWidget(
              title: 'Longest Streak',
              subtitle: longestStreak.toDays.toInt().toString(),
            ),
            const SizedBox(height: 15),
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TableCalendar(
                      headerStyle: const HeaderStyle(
                        titleCentered: true,
                        formatButtonVisible: false,
                      ),

                      calendarStyle: CalendarStyle(
                        outsideDaysVisible: false,
                        isTodayHighlighted: true,
                        todayDecoration: BoxDecoration(
                          color: AppColors.primaryColor.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(30),
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
                        debugPrint(focusedDay.toString());
                        final date = "${focusedDay.year}-${focusedDay.month}";

                        context.read<StatsCubit>().setFocusedDate(focusedDay);
                        if (relapseHistoryMap.containsKey(date)) {
                          return;
                        }
                        context.read<StatsCubit>().getRelapseHistoryByMonth(
                          date,
                        );
                      },
                      calendarBuilders: CalendarBuilders(
                        markerBuilder: (context, day, events) {
                          final date = "${day.year}-${day.month}";
                          final relapseHistoryMapByMonth =
                              relapseHistoryMap[date] ?? [];
                          if (day == firstRelapseTime.atStartOfDayUtc) {
                            return GestureDetector(
                              onTap: () {
                                context.showSnackBar(
                                  'The day you decided to quit addiction',
                                );
                              },
                              child: Center(
                                child:
                                    Image.asset(
                                      AssetIcons.quitIcon,
                                      scale: 4,
                                      color: AppColors.whiteColor,
                                    ).circularIconContainer(
                                      backgroundColor: AppColors.primaryColor,
                                    ),
                              ),
                            );
                          }
                          if (relapseHistoryMapByMonth.isNotEmpty) {
                            for (
                              int i = 0;
                              i < relapseHistoryMapByMonth.length;
                              i++
                            ) {
                              final indexedDay =
                                  relapseHistoryMapByMonth[i].day;

                              if (indexedDay == day.day) {
                                return GestureDetector(
                                  onTap: () {
                                    context.router.push(
                                      RelapseDateRoute(
                                        date: day.toDayMonthYear(),
                                        relapses: relapseHistoryMapByMonth,
                                      ),
                                    );
                                  },
                                  child: Center(
                                    child:
                                        Text(
                                          day.day.toString(),
                                          style: context.textTheme.bodyMedium
                                              ?.copyWith(
                                                color: AppColors.whiteColor,
                                              ),
                                        ).circularIconContainer(
                                          backgroundColor: Colors.red,
                                        ),
                                  ),
                                );
                              }
                            }
                          } else if (relapseHistoryMapByMonth.isEmpty) {
                            return Center(child: Text(day.day.toString()));
                          } else {
                            return Center(child: Text(day.day.toString()));
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Relapses',
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            relapseCount.toString(),
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Text(
            //   '${focusedDate.toMonthYear()} Stats',
            //   style: context.textTheme.displayLarge?.copyWith(fontSize: 22),
            // ),
          ],
        ),
      ),
    );
  }
}
