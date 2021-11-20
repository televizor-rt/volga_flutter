import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volga/blocs/blocs.dart';
import 'package:volga/pages/main/main.dart';

class SendTab extends StatelessWidget {
  SendTab({Key? key}) : super(key: key);
  final TextEditingController senderName = TextEditingController();
  final TextEditingController senderPhone = TextEditingController();
  final TextEditingController senderStation = TextEditingController();
  final TextEditingController receiverName = TextEditingController();
  final TextEditingController receiverPhone = TextEditingController();
  final TextEditingController receiverStation = TextEditingController();

  Widget _loading() {
    return const SliverToBoxAdapter(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _title({
    required String title,
    required ThemeData theme,
  }) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          title,
          style: theme.textTheme.headline3!.copyWith(
            color: theme.primaryColorDark,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String title = 'Размер посылки';
    return CustomScrollView(
      slivers: [
        const SliverPersistentHeader(
          delegate: SendAppBar(title: 'Отправить посылку'),
          pinned: true,
        ),
        BlocBuilder<SendBloc, SendState>(
          builder: (context, state) {
            if (state is SendLoadingState) {
              return _loading();
            } else {
              return _title(theme: theme, title: title);
            }
          },
        ),
        BlocBuilder<SendBloc, SendState>(
          builder: (context, state) {
            if (state is ChooseSizeState) {
              return ChooseSizeVariants(state: state);
            } else if (state is TransportationState) {
              return ChoseTransportVariants(
                state: state,
                senderName: senderName,
                senderPhone: senderPhone,
                senderStation: senderStation,
                receiverName: receiverName,
                receiverPhone: receiverPhone,
                receiverStation: receiverStation,
              );
            } else {
              return _loading();
            }
          },
        )
      ],
    );
  }
}
