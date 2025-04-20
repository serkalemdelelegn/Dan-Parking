import 'package:danparking/constants/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyOutlinedButton extends StatelessWidget {
  final String title;
  final Color color;
  Function()? onClick;
  MyOutlinedButton(
      {super.key, required this.title, required this.color, this.onClick});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onClick,
      style: OutlinedButton.styleFrom(
          foregroundColor: color,
          side: const BorderSide(
            color: primaryColor,
          )),
      child: Text(title),
    );
  }
}
