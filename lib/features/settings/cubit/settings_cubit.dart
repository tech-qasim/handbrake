import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/string_constants.dart';
import 'package:handbrake/features/settings/cubit/settings_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SharedPreferences sharedPrefs;
  SettingsCubit(this.sharedPrefs) : super(SettingsState.initial());

  void setSetting(String key, bool val) {
    sharedPrefs.setBool(key, val);
  }
}
