import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../pages.dart';

class TimeTableTab extends StatelessWidget {
  const TimeTableTab({Key? key}) : super(key: key);
  Widget _loading() {
    return const SliverToBoxAdapter(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _title({
    required String title,
    required ThemeData theme,
  }) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          title,
          style: theme.textTheme.headline3!.copyWith(
            color: theme.primaryColorDark,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        const SliverPersistentHeader(
          delegate: TimeAppBar(title: 'Расписание поездов'),
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset('assets/images/map.png'),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: SizedBox(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Скоростной поезд №1',
                            style: theme.textTheme.bodyText1!.copyWith(
                              color: theme.primaryColorDark,
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          Text(
                            'Станция №1 - 20.11.2021   22:33',
                            style: theme.textTheme.headline3!.copyWith(
                              color: theme.primaryColorDark,
                            ),
                          ),
                          Text(
                            'Станция Другая - 21.11.2021  01:13',
                            style: theme.textTheme.bodyText1!.copyWith(
                              color: theme.primaryColorDark,
                            ),
                          ),
                          const SizedBox(height: 30.0),
                          Text(
                            'Осталась 1 минута',
                            style: theme.textTheme.bodyText1!.copyWith(
                              color: theme.primaryColorDark,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          LinearPercentIndicator(
                            padding: const EdgeInsets.symmetric(horizontal: 3.0),
                            animation: true,
                            lineHeight: 5.0,
                            animationDuration: 2500,
                            percent: 0.8,
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: theme.bottomAppBarColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            childCount: 3,
          ),
        ),
      ],
    );
  }
}
