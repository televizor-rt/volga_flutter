import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:volga/blocs/blocs.dart';

import '../tabs.dart';

class DetailPanel extends StatelessWidget {
  final TextEditingController trainController;
  DetailPanel({
    required this.trainController,
    Key? key,
  }) : super(key: key);

  final _trainKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final PanelController panelController = PanelController();
    return BlocBuilder<DetailCubit, DetailState>(
      builder: (context, state) {
        switch (state.status) {
          case PanelStatus.init:
            break;
          case PanelStatus.open:
            Future.microtask(() => panelController.open());
            break;
          case PanelStatus.closed:
            Future.microtask(() => panelController.close());
            break;
        }
        return SlidingUpPanel(
          controller: panelController,
          panel: CustomScrollView(
            slivers: [
              const SliverPersistentHeader(
                delegate: PanelAppBar(),
                pinned: true,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Без названия',
                                style: theme.textTheme.subtitle1!.copyWith(
                                  color: theme.primaryColorDark,
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              SizedBox(
                                width: 16.0,
                                height: 16.0,
                                child: Image.asset(
                                  'assets/icons/edit.png',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            '00359007738060313786',
                            style: theme.textTheme.subtitle1!.copyWith(
                              color: theme.primaryColorDark,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            'Заявка создана',
                            style: theme.textTheme.headline3!.copyWith(
                              color: theme.primaryColorDark,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            'Перевозчик не назначен',
                            style: theme.textTheme.bodyText1!.copyWith(
                              color: theme.primaryColorDark,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 100.0,
                            child: Image.asset(
                              'assets/images/pack.png',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Способ перевозки',
                        style: theme.textTheme.headline3!.copyWith(
                          color: theme.primaryColorDark,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'Скоростной поезд 131 - Пассажирское купе',
                        style: theme.textTheme.bodyText1!.copyWith(
                          color: theme.primaryColorDark,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        '20.11.2021 : 16:20 - 20.11.2021 : 19:50',
                        style: theme.textTheme.bodyText1!.copyWith(
                          color: theme.primaryColorDark,
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      Text(
                        'Информация о перевозчике',
                        style: theme.textTheme.headline2!.copyWith(
                          color: theme.primaryColorDark,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, bottom: 2.0),
                        child: Text(
                          'Номер вагона',
                          style: theme.textTheme.subtitle1!.copyWith(
                            color: theme.splashColor,
                          ),
                        ),
                      ),
                      Form(
                        key: _trainKey,
                        child: SizedBox(
                          width: 256.0,
                          height: 41.0,
                          child: Card(
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: TextFormField(
                                controller: trainController,
                                style: theme.textTheme.bodyText1!.copyWith(
                                  color: theme.primaryColorDark,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 47.0,
                          height: 75.0,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    'Отсканировать QR-код перевозчика',
                                    style: theme.textTheme.headline2!.copyWith(
                                      color: theme.primaryColorLight,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: Card(
                                    color: theme.primaryColorLight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/icons/qr.png',
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      const DetailPanelButton(),
                    ],
                  ),
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
      },
    );
  }
}

