import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:volga/services/services.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 30.0),
              child: SizedBox(
                width: 256.0,
                child: Image.asset('assets/images/logo_red.png'),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  context.router.push(const MainRoute());
                },
                child: Text(
                  'Отправитель и Получатель',
                  style: theme.textTheme.subtitle1!.copyWith(
                    color: theme.primaryColorLight,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    theme.primaryColorDark,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  context.router.push(const MainRoute());
                },
                child: Text(
                  'Перевозчик',
                  style: theme.textTheme.subtitle1!.copyWith(
                    color: theme.primaryColorLight,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    theme.primaryColorDark,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  context.router.push(const MainRoute());
                },
                child: Text(
                  'Начальник поезда',
                  style: theme.textTheme.subtitle1!.copyWith(
                    color: theme.primaryColorLight,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    theme.primaryColorDark,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
