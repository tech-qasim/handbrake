import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/features/journal/cubit/journal_cubit.dart';
import 'package:handbrake/local_db/app_database.dart';

@RoutePage()
class JournalEntryScreen extends StatefulWidget {
  const JournalEntryScreen({super.key, this.journalEntry});

  final Journal? journalEntry;

  @override
  State<JournalEntryScreen> createState() => _JournalEntryScreenState();
}

class _JournalEntryScreenState extends State<JournalEntryScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.journalEntry?.title ?? '';
    contentController.text = widget.journalEntry?.content ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              if (titleController.text.isEmpty ||
                  contentController.text.isEmpty) {
                context.showSnackBar('Title and content cannot be empty');
              } else {
                if (widget.journalEntry == null) {
                  context.read<JournalCubit>().addJournalEntry(
                    titleController.text.trim(),
                    contentController.text.trim(),
                  );
                } else {
                  context.read<JournalCubit>().updateJournalEntry(
                    widget.journalEntry!.copyWith(
                      title: titleController.text,
                      content: contentController.text,
                    ),
                  );
                }

                context.router.maybePop();
              }
            },
            child: const Icon(Icons.check, size: 30),
          ),

          if (widget.journalEntry != null)
            TextButton(
              onPressed: () async {
                final result = await context
                    .read<JournalCubit>()
                    .deleteJournalEntry(widget.journalEntry!.id);

                if (result) {
                  if (context.mounted) {
                    context.showSnackBar('The entry has been deleted.');
                  }
                } else {
                  if (context.mounted) {
                    context.showSnackBar('Deletion failed');
                  }
                }
              },
              child: const Icon(Icons.delete, size: 30),
            ),
        ],
        automaticallyImplyLeading: false,
        title: Text(
          widget.journalEntry == null ? 'Journal Entry' : "Edit Journal Entry",
          style: context.textTheme.displayLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
              ),
              style: context.textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: TextField(
                controller: contentController,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: const InputDecoration(
                  hintText: 'Write your thoughts here...',
                  border: InputBorder.none,
                ),
                style: context.textTheme.bodyMedium?.copyWith(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
