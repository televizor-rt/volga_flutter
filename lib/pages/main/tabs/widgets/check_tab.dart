import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/src/provider.dart';
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
  List<XFile>? _imageFileList;
  dynamic _pickImageError;

  set _imageFile(XFile? value) {
    _imageFileList = value == null ? null : [value];
  }

  Widget _image() {
    if (_imageFileList != null) {
      return SizedBox(
        width: 200.0,
        height: 200.0,
        child: Image.file(File(_imageFileList![0].path)),
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
      _imageFile = pickedFile;
    });
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add optional parameters'),
          content: const Text('Add optional parameters'),
          actions: <Widget>[
            TextButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('PICK'),
              onPressed: () {
                onPick(500, 500, 200);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
                        'Информация об отправлении',
                        style: theme.textTheme.headline3!.copyWith(
                          color: theme.primaryColorDark,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              'Изменить',
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
                                title: 'Отправитель',
                                theme: theme,
                                width: MediaQuery.of(context).size.width / 2.5,
                              ),
                              _userInfoColumn(
                                user: state.sendPack.addressee!,
                                title: 'Получатель',
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
                                  'Размер посылки',
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
                                  'Способ перевозки',
                                  style: theme.textTheme.headline3!.copyWith(
                                    color: theme.primaryColorDark,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                Text(
                                  '${state.sendPack.type!.train ?? 'Поезд не выбран'} - '
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
                                      context.read<SendBloc>().add(
                                            CheckSendEvent(
                                              pack: state.sendPack,
                                            ),
                                          );
                                    },
                                    child: Text(
                                      'Создать заявку',
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
                                      'Отправитель',
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
                                      'Получатель',
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
