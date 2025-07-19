import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/data_constants.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/features/journal/cubit/journal_cubit.dart';
import 'package:handbrake/features/journal/widgets/journal_entry_widget.dart';
import 'package:handbrake/routes/app_router.gr.dart';
import 'package:handbrake/theme/app_colors.dart';

@RoutePage()
class JournalViewScreen extends StatefulWidget {
  const JournalViewScreen({super.key});

  @override
  State<JournalViewScreen> createState() => _JournalViewScreenState();
}

class _JournalViewScreenState extends State<JournalViewScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<JournalCubit>().getJournalEntries();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final groupedEntries = context.watch<JournalCubit>().state.groupedEntries;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Journal', style: context.textTheme.displayLarge),
      ),

      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          if (groupedEntries.containsKey(todayDate)) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Today',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.blackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...groupedEntries[todayDate]!.map((entry) {
              return GestureDetector(
                onTap: () {
                  context.router.push(JournalEntryRoute(journalEntry: entry));
                },
                child: JournalEntryWidget(journalEntry: entry),
              );
            }),
          ],

          ...groupedEntries.keys.where((dateKey) => dateKey != todayDate).map((
            dateKey,
          ) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    dateKey,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: AppColors.blackColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ...groupedEntries[dateKey]!.map((entry) {
                  return GestureDetector(
                    onTap: () {
                      context.router.push(
                        JournalEntryRoute(journalEntry: entry),
                      );
                    },
                    child: JournalEntryWidget(journalEntry: entry),
                  );
                }),
              ],
            );
          }),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(JournalEntryRoute());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
