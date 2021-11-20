import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volga/blocs/blocs.dart';
import 'package:volga/pages/main/main.dart';

class SendTab extends StatelessWidget {
  SendTab({Key? key}) : super(key: key);
  final TextEditingController senderName = TextEditingController();
  final TextEditingController senderPhone = TextEditingController();
  final TextEditingController senderStation = TextEditingController();
  final TextEditingController addresseeName = TextEditingController();
  final TextEditingController addresseePhone = TextEditingController();
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

  Widget _backButton(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Дальше',
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        const SliverPersistentHeader(
          delegate: SendAppBar(),
          pinned: true,
        ),
        BlocBuilder<SendBloc, SendState>(
          builder: (context, state) {
            if (state is SendLoadingState) {
              return _loading();
            } else if (state is ChooseSizeState) {
              return _title(theme: theme, title: state.title);
            } else if (state is TransportationState) {
              return _title(theme: theme, title: state.title);
            } else if (state is CheckState) {
              return const SliverToBoxAdapter(
                child: SizedBox(),
              );
            } else if (state is CloseState) {
              return const SliverToBoxAdapter(
                child: SizedBox(),
              );
            } else {
              return _loading();
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
                addresseeName: addresseeName,
                addresseePhone: addresseePhone,
                addresseeStation: receiverStation,
              );
            } else if (state is CheckState) {
              return CheckTab(state: state);
            } else if (state is CloseState) {
              return const FinalTab();
            } else {
              return _loading();
            }
          },
        )
      ],
    );
  }
}
