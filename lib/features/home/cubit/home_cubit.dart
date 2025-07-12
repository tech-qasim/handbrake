import 'package:drift/drift.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handbrake/constants/string_constants.dart';
import 'package:handbrake/features/home/cubit/home_state.dart';
import 'package:handbrake/local_db/app_database.dart';
import 'package:handbrake/utils/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  void addRelapseOnOnboarding(DateTime relapseDateTime) async {
    final relapse = RelapsesCompanion(relapseTime: Value(relapseDateTime));
    final result = await getIt<AppDatabase>().relapseDao.insertRelapse(relapse);

    if (result != null) {
      emit(state.copyWith(relapses: [...state.relapses, result]));
    }

    await getIt<SharedPreferences>().setBool(
      SharedPrefStrings.isUserOnboarded,
      true,
    );
  }

  void changeLastRelapseDate(DateTime dateTime) {
    emit(state.copyWith(lastRelapseDate: dateTime));
  }
}
