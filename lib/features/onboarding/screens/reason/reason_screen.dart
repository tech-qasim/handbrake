import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/extension_constants.dart';
import 'package:handbrake/constants/string_constants.dart';
import 'package:handbrake/features/home/cubit/home_cubit.dart';
import 'package:handbrake/routes/app_router.gr.dart';
import 'package:handbrake/theme/app_colors.dart';
import 'package:handbrake/utils/di.dart';
import 'package:handbrake/widgets/app_custom_button.dart';
import 'package:handbrake/widgets/app_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class ReasonScreen extends StatefulWidget {
  const ReasonScreen({super.key});

  @override
  State<ReasonScreen> createState() => _ReasonScreenState();
}

class _ReasonScreenState extends State<ReasonScreen> {
  final reasonController = TextEditingController();

  @override
  void initState() {
    reasonController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Text(
                'Why do you want to quit your addiction to porn?',
                textAlign: TextAlign.center,
                style: context.textTheme.displayLarge?.copyWith(fontSize: 26),
              ),
              const SizedBox(height: 15),
              Text(
                'We will send you daily notification so you don\'t get back to your old habits.',
                textAlign: TextAlign.center,
                style: context.textTheme.displayLarge?.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 40),
              AppTextField(
                textController: reasonController,
                hintText: 'Type here...',
                lines: 10,
                minLines: 8,
              ),
              const Spacer(),
              AppCustomButton(
                onPressed: () {
                  if (reasonController.text.isEmpty) {
                    context.showSnackBar('Please type something.');
                  } else {
                    getIt<SharedPreferences>().setString(
                      SharedPrefStrings.reason,
                      reasonController.text,
                    );

                    context.read<HomeCubit>().setReason();

                    context.router.replace(const LastRelapseRoute());
                  }
                },
                buttonText: 'Next',
                isFullWidth: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
