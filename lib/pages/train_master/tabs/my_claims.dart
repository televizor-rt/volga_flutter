import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:volga/blocs/blocs.dart';
import 'package:volga/widgets/widgets.dart';

import '../../pages.dart';

class MyClaims extends StatelessWidget {
  const MyClaims({
    Key? key,
  }) : super(key: key);

  Widget appBar() {
    return SliverPersistentHeader(
      delegate: VolgaSliverAppBar(
        expandedHeight: 375.0,
      ),
      pinned: true,
    );
  }

  Widget title({
    required TrackState state,
    required ThemeData theme,
  }) {
    if (state is TrackMapState) {
      return const SliverToBoxAdapter(
        child: SizedBox(),
      );
    } else {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Text(
                'Мои посылки',
                style: theme.textTheme.bodyText2!.copyWith(
                  color: theme.primaryColorDark,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget mainBody({
    required TrackState state,
    required BuildContext context,
    required ThemeData theme,
    required ScrollController controller,
  }) {
    Completer<GoogleMapController> _controller = Completer();
    final CameraPosition _ulanUde = const CameraPosition(
      target: LatLng(59.90541927818838, 30.291696143138022),
      zoom: 14.4746,
    );
    if (state is TrackMapState) {
      Future.microtask(() => controller.jumpTo(300));
      return SliverToBoxAdapter(
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height -
                  kToolbarHeight -
                  (tabBarHeight * 2),
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _ulanUde,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 2.7,
              right: 20,
              child: Column(
                children: [
                  InkWell(
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: theme.splashColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: SizedBox(
                        width: 20.0,
                        height: 20.0,
                        child: Image.asset('assets/icons/box_small_white.png'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  InkWell(
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: theme.primaryColorLight,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: SizedBox(
                        width: 10.0,
                        height: 10.0,
                        child: Image.asset(
                          'assets/icons/nav_red.png',
                          width: 10.0,
                          height: 10.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return SliverList(
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
      );
    }
  }

  Widget tail(TrackState state) {
    if (state is TrackMapState) {
      return const SliverToBoxAdapter(
        child: SizedBox(),
      );
    } else {
      return const SliverToBoxAdapter(
        child: SizedBox(
          height: 100,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TextEditingController trainController = TextEditingController();
    final PanelController panelController = PanelController();
    final ScrollController scrollController = ScrollController();
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<TrackCubit, TrackState>(builder: (context, state) {
            return CustomScrollView(
              controller: scrollController,
              slivers: [
                appBar(),
                title(state: state, theme: theme),
                mainBody(
                  state: state,
                  context: context,
                  theme: theme,
                  controller: scrollController,
                ),
                tail(state),
              ],
            );
          }),
          DetailPanel(
            trainController: trainController,
            panelController: panelController,
          ),
        ],
      ),
    );
  }
}
