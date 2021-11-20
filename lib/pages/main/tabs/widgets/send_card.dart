import 'package:flutter/material.dart';

class SendCard extends StatelessWidget {
  final Widget image;
  final Widget column;
  final VoidCallback onPressed;
  const SendCard({
    required this.image,
    required this.column,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 115.0,
        child: Card(
          child: Row(
            children: [
              image,
              const SizedBox(width: 30.0),
              column,
            ],
          ),
        ),
      ),
    );
  }
}
