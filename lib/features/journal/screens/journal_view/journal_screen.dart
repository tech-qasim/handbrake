import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/routes/app_router.gr.dart';

@RoutePage()
class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Journal', style: context.textTheme.displayLarge),
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
