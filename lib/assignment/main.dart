import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Color(0xFF181818),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://d1telmomo28umc.cloudfront.net/media/public/avatars/kingwang09-1685661888.jpg'))),
                width: 70,
                height: 70,
              ),
              Icon(Icons.add, color: Colors.white, size: 48.0),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: double.infinity,
            child: Text(
              "MONDAY 16",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(children: [
            Text(
              "TODAY",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 43,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              width: 10,
              height: 10,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.pink),
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
          ])
        ]),
      ),
    ),
  ));
}
