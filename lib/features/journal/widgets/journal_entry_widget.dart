import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/local_db/app_database.dart';
import 'package:handbrake/theme/app_colors.dart';

class JournalEntryWidget extends StatelessWidget {
  const JournalEntryWidget({super.key, required this.journalEntry});

  final Journal journalEntry;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.journalCardBgColor,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    journalEntry.title,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Text(
                  journalEntry.createdAt.to12HourTime(),
                  style: context.textTheme.bodyMedium?.copyWith(fontSize: 13),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(journalEntry.content),
          ],
        ),
      ),
    );
  }
}
