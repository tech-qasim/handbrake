import 'package:auto_route/auto_route.dart';
import 'package:handbrake/routes/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(page: SplashRoute.page, initial: true),
      AutoRoute(page: IntroRoute.page),
      AutoRoute(page: LastRelapseRoute.page),
      AutoRoute(page: RelapseLogRoute.page),
      AutoRoute(page: JournalEntryRoute.page),
      AutoRoute(page: RelapseDateRoute.page),
      AutoRoute(page: ReasonRoute.page),

      AutoRoute(
        page: NavigationRoute.page,
        children: [
          AutoRoute(page: CounterRoute.page),
          AutoRoute(page: StatsRoute.page),
          AutoRoute(page: JournalViewRoute.page),
          AutoRoute(page: SettingsRoute.page),
          AutoRoute(page: AchievementsRoute.page),
        ],
      ),
    ];
  }
}
