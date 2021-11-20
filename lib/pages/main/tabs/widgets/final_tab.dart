import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:volga/blocs/blocs.dart';

class FinalTab extends StatelessWidget {
  const FinalTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverList(
      delegate: SliverChildListDelegate([
        SizedBox(height: MediaQuery.of(context).size.height / 4),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              'Заявка на рассмотрении',
              style: theme.textTheme.headline2!.copyWith(
                color: theme.primaryColorDark,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30.0),
        SizedBox(
          width: double.infinity,
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<SendBloc>().add(const InitSendEvent());
              },
              child: Text(
                'Закрыть',
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
        )
      ]),
    );
  }
}
