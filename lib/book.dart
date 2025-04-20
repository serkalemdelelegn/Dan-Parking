import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:danparking/components/buttons/iconButton.dart';
import 'package:danparking/constants/constants.dart';
import "package:http/http.dart" as http;

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime _entrydateTime = DateTime.now();
  DateTime _exitdateTime = DateTime.now();
  var formatter = DateFormat('d-MM-yyyy');
  TimeOfDay? entyTime = const TimeOfDay(hour: 12, minute: 12);
  TimeOfDay? exitTime = const TimeOfDay(hour: 12, minute: 12);

  @override
  void initState() {
    super.initState();
  }

  void _updateEntryTime() async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: entyTime!,
    );
    if (newTime != null) {
      setState(() {
        entyTime = newTime;
      });
    }

    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        _entrydateTime = value!;
      });
    });
  }

  void _updateExitTime() async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: exitTime!,
    );
    if (newTime != null) {
      setState(() {
        exitTime = newTime;
      });
    }
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        _exitdateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            IconButton(
              alignment: Alignment.topLeft,
              onPressed: () => {Navigator.pushNamed(context, "/")},
              icon: Icon(
                Icons.arrow_back,
                size: 30,
              ),
              color: primaryColor,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  "Book",
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: "Jost",
                    color: primaryColor,
                  ),
                ),
                const Text(
                  " Right Now!",
                  style: TextStyle(
                    color: fadeBlack,
                    fontSize: 32,
                    fontFamily: "Jost",
                  ),
                ),
                Stack(
                  children: [
                    Container(),
                    Positioned(
                      top: 5,
                      left: 5,
                      child: Image.asset(
                        "assets/icons/Vector.png",
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Text(
              "For better Service",
              style: TextStyle(
                color: fadeBlack,
                fontFamily: "Jost",
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: primaryColor.withOpacity(0.2),
                      width: 2,
                    ),
                    color: Color.fromARGB(255, 240, 239, 239),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: Image.asset("assets/icons/car.png"),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor.withOpacity(0.3),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Vehicle Plate number",
                            style: TextStyle(
                              color: fadeBlack,
                              fontSize: 20,
                            ),
                          ),
                          const Text(
                            "026474",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ]),
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: primaryColor.withOpacity(0.2),
                      width: 2,
                    ),
                    color: Color.fromARGB(255, 240, 239, 239),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: Icon(
                        Icons.location_on,
                        size: 35,
                        color: primaryColor,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor.withOpacity(0.3),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Address",
                            style: TextStyle(
                              color: fadeBlack,
                              fontSize: 20,
                            ),
                          ),
                          const Text(
                            "Dan Energy, CMC Mikael",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ]),
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              "Select Start Date",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            myIconButton(
              "${entyTime!.hour.toString()}:${entyTime!.minute.toString()}       ${formatter.format(_entrydateTime).toString()}",
              primaryColor,
              _updateEntryTime,
              const Icon(Icons.access_time),
            ),
            SizedBox(
              height: 10,
            ),
            const Text(
              "Select End Date",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            myIconButton(
              "${exitTime!.hour.toString()}:${exitTime!.minute.toString()}       ${formatter.format(_exitdateTime).toString()}",
              secondayColor,
              _updateExitTime,
              const Icon(Icons.access_time),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async => {
                await http.post(Uri.parse("http://192.168.138.10:5000/reserve"),
                    body: {
                      "day_start": _entrydateTime.toString(),
                      "day_end": _exitdateTime.toString(),
                      "time_start":
                          "${entyTime!.hour.toString()}:${entyTime!.minute.toString()}",
                      "time_end":
                          "${exitTime!.hour.toString()}:${exitTime!.minute.toString()}",
                      "car_id": "11111"
                    })
              },
              child: Text("Book Now"),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                elevation: 0,
                minimumSize: Size(MediaQuery.of(context).size.width, 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
