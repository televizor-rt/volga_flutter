import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double tabBarHeight = 70.0;

class VolgaSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  VolgaSliverAppBar({required this.expandedHeight});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _trackController = TextEditingController();
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).bottomAppBarColor,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(16),
            ),
          ),
        ),
        Positioned(
          top: kToolbarHeight + (tabBarHeight / 3),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  'Отследить посылку',
                  style: theme.textTheme.headline1!.copyWith(
                    color: theme.primaryColorLight,
                  ),
                ),
                const SizedBox(width: 20.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    'assets/images/avatar.jpg',
                    fit: BoxFit.cover,
                    height: 30.0,
                    width: 30.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: kToolbarHeight + tabBarHeight,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: Text(
                      'Введите номер посылки или отсканируйте QR-код',
                      style: theme.textTheme.bodyText1!.copyWith(
                        color: theme.primaryColorLight,
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 40.0,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: SizedBox(
                              height: 50.0,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: _trackController,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: InkWell(
                              onTap: () {},
                              child: Card(
                                color: theme.primaryColorLight,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/icons/qr.png',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 47.0,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Отследить',
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + tabBarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
