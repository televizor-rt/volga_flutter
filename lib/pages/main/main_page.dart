import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:volga/services/router.gr.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget _tabIcon({
    required String icon,
    required String label,
    required ThemeData theme,
    required bool active,
  }) {
    return Column(
      children: [
        SizedBox(
          width: 24.0,
          height: 24.0,
          child: Image.asset(icon),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          label,
          style: theme.textTheme.bodyText1!.copyWith(
            color: active ? theme.primaryColorDark : theme.shadowColor,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        TrackTabRouter(),
        SendTabRouter(),
        TimeTableTabRouter(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        final theme = Theme.of(context);
        return Scaffold(
          body: FadeTransition(
            opacity: animation,
            child: child,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                label: '',
                activeIcon: _tabIcon(
                  icon: 'assets/icons/track_active.png',
                  label: 'Мои посылки',
                  theme: theme,
                  active: true,
                ),
                icon: _tabIcon(
                  icon: 'assets/icons/track.png',
                  label: 'Мои посылки',
                  theme: theme,
                  active: false,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                activeIcon: _tabIcon(
                  icon: 'assets/icons/send_active.png',
                  label: 'Отправить',
                  theme: theme,
                  active: true,
                ),
                icon: _tabIcon(
                  icon: 'assets/icons/send.png',
                  label: 'Отправить',
                  theme: theme,
                  active: false,
                ),
              ),
              BottomNavigationBarItem(
                label: '',
                activeIcon: _tabIcon(
                  icon: 'assets/icons/train_active.png',
                  label: 'Расписание',
                  theme: theme,
                  active: true,
                ),
                icon: _tabIcon(
                  icon: 'assets/icons/train.png',
                  label: 'Расписание',
                  theme: theme,
                  active: false,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
