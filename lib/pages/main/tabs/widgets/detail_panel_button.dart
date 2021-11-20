import 'package:flutter/material.dart';

class DetailPanelButton extends StatefulWidget {
  const DetailPanelButton({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailPanelButton> createState() => _DetailPanelButtonState();
}

class _DetailPanelButtonState extends State<DetailPanelButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool? opened;
    return Padding(
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
    );
  }
}
