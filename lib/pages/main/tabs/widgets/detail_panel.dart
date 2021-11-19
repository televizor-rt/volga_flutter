import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:volga/blocs/blocs.dart';

class DetailPanel extends StatelessWidget {
  const DetailPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final PanelController panelController = PanelController();
    return BlocBuilder<DetailCubit, DetailState>(builder: (context, state) {
      switch (state.status) {
        case PanelStatus.init:
          break;
        case PanelStatus.open:
          SchedulerBinding.instance!.addPostFrameCallback((_) {
            panelController.open();
          });
          break;
        case PanelStatus.closed:
          SchedulerBinding.instance!.addPostFrameCallback((_) {
            panelController.close();
          });
          break;
      }
      return SlidingUpPanel(
        controller: panelController,
        panel: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                right: 10.0,
                left: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Детали',
                    style: theme.textTheme.headline4!.copyWith(
                      color: theme.primaryColorDark,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<DetailCubit>().togglePanel();
                    },
                    icon: const Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        minHeight: 0,
        maxHeight: MediaQuery.of(context).size.height * 0.8,
        backdropEnabled: true,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),
        ),
      );
    });
  }
}
