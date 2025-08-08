import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/theme/app_colors.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: context.textTheme.displayLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notifications',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: AppColors.awardSubtitleColor,
                        ),
                      ),
                      10.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Journal Reminder',
                            style: context.textTheme.bodyLarge,
                          ),
                          const Spacer(),
                          Text(
                            '8:00 AM',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: AppColors.awardSubtitleColor,
                            ),
                          ),
                          7.width,
                          Switch(
                            value: true,
                            onChanged: (bool value) {
                              // Handle switch state change
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
