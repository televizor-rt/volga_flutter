import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volga/blocs/blocs.dart';

class QRForm extends StatefulWidget {
  const QRForm({Key? key}) : super(key: key);

  @override
  _QRFormState createState() => _QRFormState();
}

class _QRFormState extends State<QRForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _trackController = TextEditingController();

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
        _trackController.text = barcodeScanRes;
      }
    });
  }

  Widget button({
    required ThemeData theme,
    required String text,
    required bool light,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 24,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: theme.textTheme.headline3!.copyWith(
            color: light ? theme.primaryColorDark : theme.primaryColorLight,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            light ? theme.hoverColor : theme.primaryColorDark,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: Text(
              'Введите номер посылки или отсканируйте QR-код',
              style: theme.textTheme.bodyText1!.copyWith(
                color: theme.primaryColorLight,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 40.0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: SizedBox(
                      height: 50.0,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _trackController,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: InkWell(
                      onTap: () {
                        scanQR();
                      },
                      child: Card(
                        color: theme.primaryColorLight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/icons/qr.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 47.0,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Отследить',
                  style: theme.textTheme.headline2!.copyWith(
                    color: theme.primaryColorLight,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.black,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 37,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button(
                  theme: theme,
                  text: 'От меня',
                  light: true,
                  onPressed: () {
                    context.read<TrackCubit>().showFromMe();
                  },
                ),
                button(
                  theme: theme,
                  text: 'Мне',
                  light: true,
                  onPressed: () {
                    context.read<TrackCubit>().showMine();
                  },
                ),
                button(
                  theme: theme,
                  text: 'Все',
                  light: false,
                  onPressed: () {
                    context.read<TrackCubit>().showAll();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
