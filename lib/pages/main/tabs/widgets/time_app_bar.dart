import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volga/blocs/blocs.dart';

class TimeAppBar extends SliverPersistentHeaderDelegate {
  final String title;

  const TimeAppBar({
    required this.title,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 50.0,
          right: 10.0,
          left: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: theme.textTheme.headline4!.copyWith(
                    color: theme.primaryColorDark,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
