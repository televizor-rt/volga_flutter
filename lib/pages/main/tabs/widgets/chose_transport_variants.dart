import 'package:flutter/material.dart';
import 'package:volga/blocs/blocs.dart';

import '../../../pages.dart';

class ChoseTransportVariants extends StatefulWidget {
  final TransportationState state;
  final TextEditingController senderName;
  final TextEditingController senderPhone;
  final TextEditingController senderStation;
  final TextEditingController receiverName;
  final TextEditingController receiverPhone;
  final TextEditingController receiverStation;

  const ChoseTransportVariants({
    required this.state,
    required this.senderName,
    required this.senderPhone,
    required this.senderStation,
    required this.receiverName,
    required this.receiverPhone,
    required this.receiverStation,
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
                      _chosenIndex = index;
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
                chosen ? Card(
                  child: Form(
                    key: _userKey,
                    child: SizedBox(
                      width: 256.0,
                      height: 41.0,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: TextFormField(
                          controller: widget.senderName,
                          style: theme.textTheme.bodyText1!.copyWith(
                            color: theme.primaryColorDark,
                          ),
                        ),
                      ),
                    ),
                  ),
                ) : const SizedBox(),
              ],
            ),
          );
        },
        childCount: widget.state.types.length,
      ),
    );
  }
}
