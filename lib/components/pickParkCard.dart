import 'package:flutter/material.dart';
import 'package:danparking/constants/constants.dart';

// ignore: must_be_immutable
class PickParkCard extends StatelessWidget {
  Color color;
  String text;
  Border border;
  PickParkCard(this.color, this.text, this.border, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.5 - 20,
      decoration: BoxDecoration(
        border: border,
      ),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 80,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: color != lightGreen
                ? Image.asset(
                    "assets/icons/car2.png",
                    // width: 42,
                  )
                : Container(),
          ),
          Text(
            text,
            style: const TextStyle(),
          ),
        ],
      ),
    );
  }
}
