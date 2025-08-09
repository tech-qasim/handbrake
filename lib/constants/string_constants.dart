import 'package:handbrake/local_db/app_database.dart';
import 'package:handbrake/models/award.dart';

final String appName = 'Handbrake';

class AssetIcons {
  static const String path = "assets/icons";
  static const String quitIcon = "$path/fist.png";
  static const String blessingIon = "$path/blessing.png";
}

class SharedPrefStrings {
  static const String isUserOnboarded = 'isUserOnboarded';
  static const String longestStreak = 'longestStreak';
  static const String lastAchievedAward = 'lastAchievedAward';
  static const String recentStreak = "recentStreak";
  static const String lastRewardTime = "lastRewardTime";
  static const String blessingCount = "blessingCount";
  static const String reason = "reason";
  static const String settings = "settings";
  static const String journalReminder = 'journalReminder';
}

class NotificationsChannelStrings {
  static const String rewardNotiChannel = 'reward_noti_channel';
  static const String dailyJournalReminderChannel =
      'daily_journal_reminder_channel';
}

List<String> triggersData = [
  'Boredom',
  'Stress',
  'Social Media',
  'Movie Scene',
  'Loneliness',
];

final emotions = ['😀', '😐', '😣', '😓', '😭'];

final List<Award> awards = [
  Award(title: "The First Step", daysRequired: 1),
  Award(title: "Urge Warrior", daysRequired: 3),
  Award(title: "Foundation Builder", daysRequired: 5),
  Award(title: "One Week Clean", daysRequired: 7),
  Award(title: "Double Digits", daysRequired: 10),
  Award(title: "Brain Reboot Begins", daysRequired: 14),
  Award(title: "Flatline Survivor", daysRequired: 21),
  Award(title: "One Month Strong", daysRequired: 30),
  Award(title: "Halfway Hero", daysRequired: 45),
  Award(title: "Inner Peace", daysRequired: 60),
  Award(title: "Master of Urges", daysRequired: 75),
  Award(title: "Reborn", daysRequired: 90),
];

class NotificationsIds {
  static const int awardId = 1001;
  static const int journalReminderId = 2001;
  static const int reasonReminderId = 3001;
}
