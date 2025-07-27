import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/local_db/app_database.dart';

@RoutePage()
class RelapseDateScreen extends StatelessWidget {
  const RelapseDateScreen({
    super.key,
    required this.date,
    required this.relapses,
  });

  final String date;
  final List<Relapse> relapses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(date, style: context.textTheme.displayLarge)),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        itemCount: relapses.length,
        itemBuilder: (context, index) {
          final relapse = relapses[index];

          return Card(
            elevation: 0,
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(relapse.relapseTime.toFullDate()),
                  const SizedBox(height: 10),
                  Text(relapse.relapseTime.to12HourTime()),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 10);
        },
      ),
    );
  }
}
