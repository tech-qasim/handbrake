import 'package:auto_route/auto_route.dart';
import 'package:handbrake/routes/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(page: IntroRoute.page),
      AutoRoute(page: LastRelapseRoute.page),
      AutoRoute(
        initial: true,
        page: NavigationRoute.page,
        children: [
          AutoRoute(page: HomeRoute.page),
          AutoRoute(page: StatsRoute.page),
          AutoRoute(page: JournalRoute.page),
          AutoRoute(page: SettingsRoute.page),
        ],
      ),
    ];
  }
}
