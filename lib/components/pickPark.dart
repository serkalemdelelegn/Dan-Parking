import 'package:danparking/components/pickParkCard.dart';
import 'package:flutter/material.dart';
import 'package:danparking/constants/constants.dart';

// ignore: must_be_immutable
class PickPark extends StatelessWidget {
  Color firstColor;
  Color secondColor;
  Color thirdColor;
  Color fourthColor;
  String firstText;
  String secondText;
  String thirdText;
  String fourthText;
  PickPark(this.firstColor, this.secondColor, this.thirdColor, this.fourthColor,
      this.firstText, this.secondText, this.thirdText, this.fourthText,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          PickParkCard(
            firstColor,
            firstText,
            const Border(
              top: BorderSide(color: fadeBlack),
              bottom: BorderSide(color: fadeBlack),
              right: BorderSide(color: fadeBlack),
            ),
          ),
          PickParkCard(
            secondColor,
            secondText,
            const Border(
              top: BorderSide(color: fadeBlack),
              bottom: BorderSide(color: fadeBlack),
            ),
          ),
        ],
      ),
      Row(
        children: [
          PickParkCard(
            thirdColor,
            thirdText,
            const Border(
              bottom: BorderSide(color: fadeBlack),
              right: BorderSide(color: fadeBlack),
            ),
          ),
          PickParkCard(
            fourthColor,
            fourthText,
            const Border(
              bottom: BorderSide(color: fadeBlack),
            ),
          ),
        ],
      )
    ]);
  }
}
