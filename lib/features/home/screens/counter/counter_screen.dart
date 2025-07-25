import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/features/home/cubit/home_cubit.dart';
import 'package:handbrake/routes/app_router.gr.dart';
import 'package:handbrake/theme/app_colors.dart';
import 'package:handbrake/widgets/app_custom_button.dart';

@RoutePage()
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<HomeCubit>().setLastRelapseDateTime();
    //   context.read<HomeCubit>().setFirstRelapseDateTime();
    //   context.read<HomeCubit>().startSoberTimer();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final soberTime = context.watch<HomeCubit>().state.soberTime;

    int days = soberTime.inDays;
    int hours = soberTime.inHours % 24;
    int minutes = soberTime.inMinutes % 60;
    int seconds = soberTime.inSeconds % 60;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home', style: context.textTheme.displayLarge),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Text(
                'You\'ve been clean for',
                style: context.textTheme.bodyMedium?.copyWith(fontSize: 25),
              ),
              const SizedBox(height: 10),
              Text(
                '$days days',
                style: context.textTheme.displayLarge?.copyWith(fontSize: 30),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TimeContainer(time: days, timeType: 'Days'),
                  TimeContainer(time: hours, timeType: 'Hours'),
                  TimeContainer(time: minutes, timeType: 'Minutes'),
                  TimeContainer(time: seconds, timeType: 'Seconds'),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                'Time since you last relapsed',
                style: context.textTheme.bodyMedium?.copyWith(fontSize: 15),
              ),
              const SizedBox(height: 20),
              AppCustomButton(
                onPressed: () {
                  context.router.push(const RelapseLogRoute());
                },
                buttonText: 'Relapse',
                isFullWidth: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeContainer extends StatelessWidget {
  const TimeContainer({super.key, required this.time, required this.timeType});

  final int time;
  final String timeType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.timeBgColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Text(time.toString(), style: context.textTheme.displayLarge),
          ),
        ),
        const SizedBox(height: 10),
        Text(timeType),
      ],
    );
  }
}
