import 'package:flutter/material.dart';
import 'package:volga/widgets/widgets.dart';

import '../../pages.dart';

class TrackTab extends StatelessWidget {
  const TrackTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TextEditingController trainController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: VolgaSliverAppBar(
                  expandedHeight: MediaQuery.of(context).size.height / 2,
                ),
                pinned: true,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Мои посылки',
                    style: theme.textTheme.bodyText2!.copyWith(
                      color: theme.primaryColorDark,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 20.0,
                      ),
                      child: ParcelInfo(),
                    );
                  },
                  childCount: 5,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 100,
                ),
              ),
            ],
          ),
          DetailPanel(trainController: trainController),
        ],
      ),
    );
  }
}
