import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/string_constants.dart';
import 'package:handbrake/features/settings/cubit/settings_state.dart';
import 'package:handbrake/models/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SharedPreferences sharedPrefs;
  SettingsCubit(this.sharedPrefs) : super(SettingsState.initial());

  Future<void> saveSettings(Settings settings) async {
    await sharedPrefs.setString(
      SharedPrefStrings.settings,
      jsonEncode(settings.toMap()),
    );
    emit(state.copyWith(appSettings: settings));
  }

  Future<void> loadSettings() async {
    final settingsString = sharedPrefs.getString(SharedPrefStrings.settings);
    if (settingsString != null) {
      final settingsMap = jsonDecode(settingsString) as Map<String, dynamic>;
      final settings = Settings.fromMap(settingsMap);
      emit(state.copyWith(appSettings: settings));
    }
  }
}
