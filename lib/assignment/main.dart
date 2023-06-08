import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://d1telmomo28umc.cloudfront.net/media/public/avatars/kingwang09-1685661888.jpg'))),
                width: 70,
                height: 70,
              ),
              const Icon(Icons.add, color: Colors.white, size: 48.0),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const SizedBox(
            width: double.infinity,
            child: Text(
              "MONDAY 16",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          Row(children: [
            const Text(
              "TODAY",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 43,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.pink),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "17",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.3),
                    fontSize: 43,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "18",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.3),
                    fontSize: 43,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "19",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.3),
                    fontSize: 43,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ]),
          const SizedBox(
            height: 15,
          ),
          CalendarCard(
            startHour: "11",
            startMinitue: "30",
            endHour: "12",
            endMinitue: "20",
            title: "DESIGN MEETING",
            bgColor: Colors.yellow,
            participants: const {"ALEX", "HELENA", "NANA"},
          ),
          CalendarCard(
            startHour: "12",
            startMinitue: "35",
            endHour: "14",
            endMinitue: "10",
            title: "DAILY PROJECT",
            bgColor: Colors.purple,
            participants: const {"ME", "RECHARD", "CYRY", "+4"},
          ),
          CalendarCard(
            startHour: "15",
            startMinitue: "00",
            endHour: "16",
            endMinitue: "30",
            title: "WEEKLY PLANNING",
            bgColor: Colors.lightGreen,
            participants: const {"DEN", "NANA", "MARK"},
          ),
        ]),
      ),
    ),
  ));
}

class CalendarCard extends StatelessWidget {
  String startHour, startMinitue, endHour, endMinitue, title;
  Set<String> participants;
  Color bgColor;

  CalendarCard({
    super.key,
    required this.startHour,
    required this.startMinitue,
    required this.endHour,
    required this.endMinitue,
    required this.title,
    required this.participants,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> bottomWidgets = List.empty(growable: true);
    bottomWidgets.add(const SizedBox(
      width: 50,
    ));
    for (var element in participants) {
      if (element == "ME") {
        bottomWidgets.add(Padding(
          padding: const EdgeInsets.all(7.0),
          child: Text(
            element,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ));
      } else {
        bottomWidgets.add(Padding(
          padding: const EdgeInsets.all(7.0),
          child: Text(
            element,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black45,
            ),
          ),
        ));
      }
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(20),
      height: 190,
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      startHour,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Text(startMinitue),
                  Container(
                    height: 20,
                    decoration: BoxDecoration(border: Border.all()),
                  ),
                  Text(
                    endHour,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(endMinitue)
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Flexible(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 45, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: bottomWidgets,
          )
        ],
      ),
    );
  }
}
