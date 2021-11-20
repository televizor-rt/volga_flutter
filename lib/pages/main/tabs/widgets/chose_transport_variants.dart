import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:volga/blocs/blocs.dart';
import 'package:volga/models/models.dart';

import '../../../pages.dart';

class ChoseTransportVariants extends StatefulWidget {
  final TransportationState state;
  final TextEditingController senderName;
  final TextEditingController senderPhone;
  final TextEditingController senderStation;
  final TextEditingController addresseeName;
  final TextEditingController addresseePhone;
  final TextEditingController addresseeStation;

  const ChoseTransportVariants({
    required this.state,
    required this.senderName,
    required this.senderPhone,
    required this.senderStation,
    required this.addresseeName,
    required this.addresseePhone,
    required this.addresseeStation,
    Key? key,
  }) : super(key: key);

  @override
  State<ChoseTransportVariants> createState() => _ChoseTransportVariantsState();
}

class _ChoseTransportVariantsState extends State<ChoseTransportVariants> {
  String _buttonName = 'Перейти к расписанию';
  int _chosenIndex = -1;
  final _userKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          var chosen = _chosenIndex == index;
          var currentType = widget.state.types[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Column(
              children: [
                SendCard(
                  onPressed: () {
                    setState(() {
                      if (_chosenIndex != index) {
                        _chosenIndex = index;
                      } else {
                        _chosenIndex = -1;
                      }
                    });
                  },
                  image: SizedBox(
                    width: 70.0,
                    height: 70.0,
                    child: Image.asset(
                      currentType.image,
                    ),
                  ),
                  column: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            currentType.name,
                            style: theme.textTheme.headline3!.copyWith(
                              color: theme.primaryColorDark,
                            ),
                          ),
                          chosen
                              ? SizedBox(
                                  width: 15.0,
                                  height: 15.0,
                                  child: Image.asset(
                                    'assets/icons/check.png',
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            _buttonName,
                            style: theme.textTheme.subtitle1!.copyWith(
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
                    ],
                  ),
                ),
                chosen
                    ? Card(
                        child: Form(
                          key: _userKey,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Информация об отправителе',
                                  style: theme.textTheme.subtitle1!.copyWith(
                                    color: theme.primaryColorDark,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Имя',
                                  style: theme.textTheme.subtitle2!.copyWith(
                                    color: theme.splashColor,
                                  ),
                                ),
                                TextFormField(
                                  controller: widget.senderName,
                                  style: theme.textTheme.bodyText1!.copyWith(
                                    color: theme.primaryColorDark,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Номер телефона',
                                  style: theme.textTheme.subtitle2!.copyWith(
                                    color: theme.splashColor,
                                  ),
                                ),
                                TextFormField(
                                  controller: widget.senderPhone,
                                  style: theme.textTheme.bodyText1!.copyWith(
                                    color: theme.primaryColorDark,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Станция',
                                  style: theme.textTheme.subtitle2!.copyWith(
                                    color: theme.splashColor,
                                  ),
                                ),
                                TextFormField(
                                  controller: widget.senderStation,
                                  style: theme.textTheme.bodyText1!.copyWith(
                                    color: theme.primaryColorDark,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Информация о получателе',
                                  style: theme.textTheme.subtitle1!.copyWith(
                                    color: theme.primaryColorDark,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Имя',
                                  style: theme.textTheme.subtitle2!.copyWith(
                                    color: theme.splashColor,
                                  ),
                                ),
                                TextFormField(
                                  controller: widget.addresseeName,
                                  style: theme.textTheme.bodyText1!.copyWith(
                                    color: theme.primaryColorDark,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Номер телефона',
                                  style: theme.textTheme.subtitle2!.copyWith(
                                    color: theme.splashColor,
                                  ),
                                ),
                                TextFormField(
                                  controller: widget.addresseePhone,
                                  style: theme.textTheme.bodyText1!.copyWith(
                                    color: theme.primaryColorDark,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Станция',
                                  style: theme.textTheme.subtitle2!.copyWith(
                                    color: theme.splashColor,
                                  ),
                                ),
                                TextFormField(
                                  controller: widget.addresseeStation,
                                  style: theme.textTheme.bodyText1!.copyWith(
                                    color: theme.primaryColorDark,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      User sender = User(
                                        userName: widget.senderName.text,
                                        userPhone: widget.senderPhone.text,
                                        userAddress: widget.senderStation.text,
                                      );
                                      User addressee = User(
                                        userName: widget.addresseeName.text,
                                        userPhone: widget.addresseePhone.text,
                                        userAddress: widget.addresseeStation.text,
                                      );
                                      context.read<SendBloc>().add(
                                            ChooseTransportSendEvent(
                                              type: currentType,
                                              sender: sender,
                                              addressee: addressee,
                                            ),
                                          );
                                    },
                                    child: Text(
                                      'Дальше',
                                      style:
                                          theme.textTheme.headline2!.copyWith(
                                        color: theme.primaryColorLight,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 50),
                              ],
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          );
        },
        childCount: widget.state.types.length,
      ),
    );
  }
}
