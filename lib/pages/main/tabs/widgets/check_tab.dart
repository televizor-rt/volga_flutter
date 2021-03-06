import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:volga/blocs/blocs.dart';
import 'package:volga/models/models.dart';

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);

class CheckTab extends StatefulWidget {
  final CheckState state;
  const CheckTab({
    required this.state,
    Key? key,
  }) : super(key: key);

  @override
  State<CheckTab> createState() => _CheckTabState();
}

class _CheckTabState extends State<CheckTab> {
  File? _file;

  Widget _image() {
    if (_file != null) {
      return SizedBox(
        width: 200.0,
        height: 200.0,
        child: Image.file(_file!),
      );
    } else {
      return SizedBox(
        width: 200.0,
        height: 200.0,
        child: Image.asset(
          'assets/images/no_photo.png',
        ),
      );
    }
  }

  Widget _userInfoColumn({
    required User user,
    required ThemeData theme,
    required double width,
    required String title,
  }) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.headline3!.copyWith(
              color: theme.primaryColorDark,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            user.userName,
            style: theme.textTheme.bodyText1!.copyWith(
              color: theme.primaryColorDark,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            user.userPhone,
            style: theme.textTheme.bodyText1!.copyWith(
              color: theme.primaryColorDark,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            user.userAddress,
            style: theme.textTheme.bodyText1!.copyWith(
              color: theme.primaryColorDark,
            ),
          ),
        ],
      ),
    );
  }

  void _takePhoto({
    required ImagePicker picker,
  }) async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      _file = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ImagePicker picker = ImagePicker();
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextButton(
            onPressed: () {
              _takePhoto(picker: picker);
            },
            child: Container(
              color: theme.hoverColor,
              child: Center(
                child: _image(),
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(
              color: theme.disabledColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '???????????????????? ???? ??????????????????????',
                        style: theme.textTheme.headline3!.copyWith(
                          color: theme.primaryColorDark,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              '????????????????',
                              style: theme.textTheme.bodyText1!.copyWith(
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
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  BlocBuilder<SendBloc, SendState>(builder: (context, state) {
                    if (state is CheckState) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _userInfoColumn(
                                user: state.sendPack.sender!,
                                title: '??????????????????????',
                                theme: theme,
                                width: MediaQuery.of(context).size.width / 2.5,
                              ),
                              _userInfoColumn(
                                user: state.sendPack.addressee!,
                                title: '????????????????????',
                                theme: theme,
                                width: MediaQuery.of(context).size.width / 2.5,
                              ),
                            ],
                          ),
                          const SizedBox(height: 30.0),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '???????????? ??????????????',
                                  style: theme.textTheme.headline3!.copyWith(
                                    color: theme.primaryColorDark,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  state.sendPack.size!.name,
                                  style: theme.textTheme.bodyText1!.copyWith(
                                    color: theme.primaryColorDark,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Text(
                                  '???????????? ??????????????????',
                                  style: theme.textTheme.headline3!.copyWith(
                                    color: theme.primaryColorDark,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  '${state.sendPack.type!.train ?? '?????????? ???? ????????????'} - '
                                  '${state.sendPack.type!.name}',
                                  style: theme.textTheme.bodyText1!.copyWith(
                                    color: theme.primaryColorDark,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      var sendPack = SendPack(
                                        sender: state.sendPack.sender,
                                        addressee: state.sendPack.addressee,
                                        size: state.sendPack.size,
                                        type: state.sendPack.type,
                                        image: state.sendPack.image,
                                      );
                                      context.read<SendBloc>().add(
                                            CheckSendEvent(
                                              pack: sendPack,
                                            ),
                                          );
                                    },
                                    child: Text(
                                      '?????????????? ????????????',
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
                                const SizedBox(height: 20.0),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '??????????????????????',
                                      style:
                                          theme.textTheme.headline3!.copyWith(
                                        color: theme.primaryColorDark,
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    const CircularProgressIndicator(),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '????????????????????',
                                      style:
                                          theme.textTheme.headline3!.copyWith(
                                        color: theme.primaryColorDark,
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    const CircularProgressIndicator(),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
