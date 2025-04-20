import 'package:flutter/material.dart';

class GridDashboard extends StatelessWidget {
  final Items item1 = new Items(
    title: "Find Us",
    subtitle: "By using google map",
    color: 0xff0E2D69,
    img: "assets/icons/loc.png",
    navigate: "/map",
    top: -0.25,
    right: 0.5,
  );

  final Items item2 = new Items(
    title: "Book",
    subtitle: "Bocali, Apple",
    color: 0xffFF5959,
    img: "assets/icons/book.png",
    navigate: "/pickbook",
    top: -0.32,
    right: 0.14,
  );
  final Items item3 = new Items(
    title: "My History",
    subtitle: "Lucy Mao going to Office",
    color: 0xff4CD97B,
    img: "assets/icons/hist.png",
    navigate: "/hist",
    top: -0.1,
    right: 0.44,
  );
  final Items item4 = new Items(
      title: "Parking Tracer",
      subtitle: "Rose favirited your Post",
      color: 0xffFFB259,
      img: "assets/icons/track.png",
      navigate: "/book",
      top: 0.57,
      right: 0.4);

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4];
    final double x = MediaQuery.of(context).size.width * 0.6;

    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(bottom: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, data.navigate);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(data.color),
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 16,
                        ),
                        Image.asset(
                          data.img,
                          width: 42,
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(data.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "Jost",
                                fontWeight: FontWeight.w600)),
                        SizedBox(
                          height: 8,
                        ),
                        Text(data.subtitle,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600)),
                        SizedBox(
                          height: 14,
                        ),
                      ],
                    ),
                    Positioned(
                      top: x * data.top,
                      right: x * data.right,
                      height: x * 0.4,
                      width: x * .4,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.2),
                        ),
                        padding: EdgeInsets.all(5),
                      ),
                    ),
                    Positioned(
                      top: x * -0.19,
                      right: x * -0.12,
                      height: x * 0.4,
                      width: x * .4,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.2),
                        ),
                        padding: EdgeInsets.all(5),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String img;
  int color;
  String navigate;
  double top;
  double right;

  Items({
    required this.title,
    required this.subtitle,
    required this.img,
    required this.color,
    required this.navigate,
    required this.top,
    required this.right,
  });
}
