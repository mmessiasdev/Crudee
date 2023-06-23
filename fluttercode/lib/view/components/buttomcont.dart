import 'package:flutter/material.dart';

import 'colors.dart';

class ButtomCont extends StatelessWidget {
  ButtomCont(
      {super.key,
      required this.url,
      required this.onClick,
      required this.border});

  String url;
  final Function onClick;
  final Color border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: AvatarColor,
          border: Border.all(
            width: 2,
            color: border,
          ),
        ),
        child: Image.network(
          url,
          fit: BoxFit.cover,
        ),
      ),
      onTap: () {
        onClick();
      },
    );
  }
}