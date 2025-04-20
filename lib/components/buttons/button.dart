import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class myButton extends StatelessWidget {
  final String title;
  final Color color;
  Function()? onClick;

  myButton({super.key, required this.title, required this.color, this.onClick});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 0,
        // minimumSize: Size(MediaQuery.of(context).size.width, 40),
      ),
      child: Text(title),
    );
  }
}
