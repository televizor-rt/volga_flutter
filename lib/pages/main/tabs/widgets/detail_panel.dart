import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:volga/blocs/blocs.dart';

import '../tabs.dart';

class DetailPanel extends StatefulWidget {
  final TextEditingController trainController;
  final PanelController panelController;
  const DetailPanel({
    required this.trainController,
    required this.panelController,
    Key? key,
  }) : super(key: key);

  @override
  State<DetailPanel> createState() => _DetailPanelState();
}

class _DetailPanelState extends State<DetailPanel> {
  final _trainKey = GlobalKey<FormState>();

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Закрыть', true, ScanMode.QR);
    } on PlatformException {
      barcodeScanRes = 'Прочитать код не вышло';
    }
    if (!mounted) return;

    setState(() {
      if (barcodeScanRes != '-1') {
        widget.trainController.text = barcodeScanRes;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool? opened;
    return BlocBuilder<DetailCubit, DetailState>(
      builder: (context, state) {
        switch (state.status) {
          case PanelStatus.init:
            break;
          case PanelStatus.open:
            Future.microtask(() => widget.panelController.open());
            break;
          case PanelStatus.closed:
            Future.microtask(() => widget.panelController.close());
            break;
        }
        return SlidingUpPanel(
          controller: widget.panelController,
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
                                controller: widget.trainController,
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
                            onPressed: () {
                              scanQR();
                            },
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: SizedBox(
                          height: 75.0,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                if (opened != null) {
                                  opened = !opened!;
                                } else {
                                  opened = true;
                                }
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 55.0,
                                  height: 55.0,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).bottomAppBarColor,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      'assets/icons/send_white.png',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Заявка создана',
                                        style: theme.textTheme.subtitle2!.copyWith(
                                          color: theme.primaryColorDark,
                                        ),
                                      ),
                                      Text(
                                        '20.11.2021 - 20:45',
                                        style: theme.textTheme.subtitle2!.copyWith(
                                          color: theme.primaryColorDark,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 18.0,
                                    height: 18.0,
                                    child: Image.asset(
                                      opened ?? false
                                          ? 'assets/icons/up.png'
                                          : 'assets/icons/down.png',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
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

