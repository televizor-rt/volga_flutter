import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:volga/blocs/blocs.dart';

class ParcelInfo extends StatelessWidget {
  const ParcelInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            '00359007738060313786',
            style: theme.textTheme.subtitle1!.copyWith(
              color: theme.primaryColorDark,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            'Без названия',
            style: theme.textTheme.bodyText1!.copyWith(
              color: theme.primaryColorDark,
            ),
          ),
        ),
        const SizedBox(height: 17),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            'В пути',
            style: theme.textTheme.headline3!.copyWith(
              color: theme.primaryColorDark,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: LinearPercentIndicator(
            animation: true,
            lineHeight: 5.0,
            animationDuration: 2500,
            percent: 0.8,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: theme.bottomAppBarColor,
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(0),
            ),
            child: Row(
              children: [
                Text(
                  'Детали',
                  style: theme.textTheme.headline4!.copyWith(
                    color: theme.primaryColorDark,
                  ),
                ),
                SizedBox(
                  width: 15.0,
                  height: 15.0,
                  child: Image.asset(
                    'assets/icons/right.png',
                  ),
                ),
              ],
            ),
            onPressed: () {
              context.read<DetailCubit>().togglePanel();
            },
          ),
        ),
      ],
    );
  }
}
