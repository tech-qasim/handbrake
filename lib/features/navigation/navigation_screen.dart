import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:handbrake/routes/app_router.gr.dart';
import 'package:handbrake/theme/app_colors.dart';

@RoutePage()
class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      navigatorObservers: () => [HeroController()],
      routes: [
        const CounterRoute(),
        const StatsRoute(),
        const JournalViewRoute(),
        const SettingsRoute(),
      ],
      builder: (context, child) {
        final tabRouter = AutoTabsRouter.of(context);
        final selectedIndex = tabRouter.activeIndex;

        return NavigationMobScreen(
          selectedIndex: selectedIndex,
          tabsRouter: tabRouter,
          child: child,
        );
      },
    );
  }
}

class NavigationMobScreen extends StatelessWidget {
  const NavigationMobScreen({
    super.key,
    required this.selectedIndex,
    required this.tabsRouter,
    required this.child,
  });

  final int selectedIndex;
  final TabsRouter tabsRouter;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationWidget(
        selectedIndex: selectedIndex,
        onItemSelected: (index) {
          tabsRouter.setActiveIndex(index);
        },
      ),
    );
  }
}

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 100,
          child: BottomNavigationBar(
            elevation: 20,
            backgroundColor: AppColors.whiteColor,
            currentIndex: selectedIndex,
            items: const [
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.home, color: AppColors.primaryColor),
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.bar_chart,
                  color: AppColors.primaryColor,
                ),
                icon: Icon(Icons.bar_chart),
                label: 'Stats',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.book, color: AppColors.primaryColor),
                icon: Icon(Icons.book),
                label: 'Journal',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.settings, color: AppColors.primaryColor),
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            onTap: onItemSelected,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            // selectedItemColor: AppColors.primeryColor,
            // unselectedItemColor: AppColors.darkGrey,
          ),
        ),
      ],
    );
  }
}
