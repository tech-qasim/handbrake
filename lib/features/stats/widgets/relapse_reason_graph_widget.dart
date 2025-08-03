import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/features/stats/cubit/stats_cubit.dart';
import 'package:handbrake/theme/app_colors.dart';

class RelapseReasonGraphWidget extends StatelessWidget {
  const RelapseReasonGraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final triggerCountMap = context.watch<StatsCubit>().state.triggerCountMap;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Relapse Reasons',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          if (triggerCountMap.isEmpty) const Text('No data available.'),
          if (triggerCountMap.isNotEmpty)
            ...triggerCountMap.entries.map((entry) {
              final reason = entry.key;
              final count = entry.value;
              final maxCount = triggerCountMap.values.isEmpty
                  ? 1
                  : triggerCountMap.values.reduce((a, b) => a > b ? a : b);

              final randomColor = Color(
                Random().nextInt(0xFFFFFFFF),
              ).withOpacity(1.0);

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            reason,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                        Text(
                          '$count',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Container(
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: count / maxCount,
                        child: Container(
                          decoration: BoxDecoration(
                            color: randomColor,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              // BoxShadow(
                              //   color: item.color.withOpacity(0.3),
                              //   blurRadius: 4,
                              //   offset: Offset(0, 2),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
        ],
      ),
    );
  }
}
