import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:volga/blocs/blocs.dart';

import '../../../pages.dart';

class ChooseSizeVariants extends StatelessWidget {
  final ChooseSizeState state;
  const ChooseSizeVariants({
    required this.state,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          var currentSize = state.sizes[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: SendCard(
              onPressed: () {
                context.read<SendBloc>().add(
                  ChooseSizeSendEvent(
                    size: currentSize,
                  ),
                );
              },
              image: Image.asset(currentSize.image),
              column: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currentSize.name,
                    style: theme.textTheme.headline3!.copyWith(
                      color: theme.primaryColorDark,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    currentSize.size,
                    style: theme.textTheme.subtitle1!.copyWith(
                      color: theme.primaryColorDark,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    currentSize.type,
                    style: theme.textTheme.bodyText1!.copyWith(
                      color: theme.primaryColorDark,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: state.sizes.length,
      ),
    );
  }
}