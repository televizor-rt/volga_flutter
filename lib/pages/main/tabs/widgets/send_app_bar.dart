import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volga/blocs/blocs.dart';

class SendAppBar extends SliverPersistentHeaderDelegate {
  const SendAppBar();

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
        child: BlocBuilder<SendBloc, SendState>(builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state.mainTitle,
                    style: theme.textTheme.headline4!.copyWith(
                      color: theme.primaryColorDark,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  BlocBuilder<SendBloc, SendState>(
                    builder: (context, state) {
                      if (state is TransportationState) {
                        return SizedBox(
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<SendBloc>().add(
                                    const InitSendEvent(),
                                  );
                            },
                            child: Text(
                              'Назад',
                              style: theme.textTheme.subtitle1!.copyWith(
                                color: theme.primaryColorLight,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                theme.bottomAppBarColor,
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  )
                ],
              ),
            ],
          );
        }),
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
