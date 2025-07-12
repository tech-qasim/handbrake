import 'package:auto_route/auto_route.dart';
import 'package:handbrake/routes/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(page: IntroRoute.page, initial: true),
      AutoRoute(page: LastRelapseRoute.page),
    ];
  }
}
