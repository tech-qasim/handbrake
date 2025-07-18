import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/data_constants.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/features/journal/cubit/journal_cubit.dart';
import 'package:handbrake/routes/app_router.gr.dart';
import 'package:handbrake/theme/app_colors.dart';

@RoutePage()
class JournalScreen extends StatefulWidget {
  const JournalScreen({super.key});

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<JournalCubit>().getJournalEntries();
      context.read<JournalCubit>().groupEntriesByDate();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final journalEntries = context.watch<JournalCubit>().state.journalEntries;
    final groupedEntries = context.watch<JournalCubit>().state.groupedEntries;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Journal', style: context.textTheme.displayLarge),
      ),

      body: ListView(
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
              return Text(entry.content);
            }),
          ],
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(const JournalEntryRoute());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
