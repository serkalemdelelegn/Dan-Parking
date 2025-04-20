import 'package:danparking/components/pickPark.dart';
import 'package:flutter/material.dart';
import 'package:danparking/constants/constants.dart';

class PickBookPage extends StatefulWidget {
  const PickBookPage({super.key});

  @override
  State<PickBookPage> createState() => _PickBookPageState();
}

class _PickBookPageState extends State<PickBookPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                IconButton(
                  padding: const EdgeInsets.all(0),
                  alignment: Alignment.centerLeft,
                  onPressed: () => {Navigator.pushNamed(context, "/")},
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 35,
                  ),
                  color: primaryColor,
                ),
                const Text(
                  "Pick Parking Slot",
                  style: TextStyle(
                    color: fadeBlack,
                    fontSize: 32,
                    fontFamily: "Jost",
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Select Parking Space",
              style: TextStyle(
                color: fadeBlack,
                fontFamily: "Jost",
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            PickPark(
              secondayColor,
              orange,
              lightGreen,
              lightGreen,
              "Slot 1",
              "Slot 2",
              "Slot 3",
              "Slot 4",
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Image.asset(
                "assets/icons/car3.png",
                height: MediaQuery.of(context).size.height * 0.4,
              ),
            )
          ],
        ),
      ),
    );
  }
}
