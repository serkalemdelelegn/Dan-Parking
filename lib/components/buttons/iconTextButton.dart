import 'package:flutter/material.dart';

class myTextIconButton extends StatelessWidget {
  final String title;
  final Color color;
  final Icon icon;
  final String onClick;

  myTextIconButton(this.title, this.color, this.onClick, this.icon);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => {
        Navigator.pushNamed(context, onClick),
      },
      label: Text(title),
      icon: icon,
      style: ElevatedButton.styleFrom(
          foregroundColor: color,
          elevation: 0,
          textStyle: TextStyle(fontSize: 20, fontFamily: "Jost")),
    );
  }
}
