// widget for the appBar
import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
    ),
    title: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage("assets/images/icon.png"),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "Todoit",
          style: TextStyle(
              fontSize: 25,
              fontFamily: 'Poppins',
              color: Color.fromARGB(255, 61, 61, 61)),
        )
      ],
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      )
    ],
  );
}
