import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:volga/services/services.dart';

import '../../../pages.dart';

const double tabBarHeight = 70.0;

class VolgaSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  VolgaSliverAppBar({required this.expandedHeight});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).bottomAppBarColor,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(16),
            ),
          ),
        ),
        Positioned(
          top: kToolbarHeight + (tabBarHeight / 3),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Отследить посылку',
                  style: theme.textTheme.headline1!.copyWith(
                    color: theme.primaryColorLight,
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.router.push(const RoleScreenRouter());
                  },
                  child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: Image.asset(
                      'assets/icons/log_out.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: kToolbarHeight + tabBarHeight,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: const QRForm(),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + tabBarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
