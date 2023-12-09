import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rental_application/Home.dart';
import 'package:rental_application/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ss extends StatelessWidget {
  const ss({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () async {
      final sp = await SharedPreferences.getInstance();

      if (sp.containsKey('login')) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Home(),
        ));
      } else {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Login(),
        ));
      }
    });

    return SafeArea(
      child: Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                "assets/images/intropage1.jpeg",
                fit: BoxFit.fill,
                height: 150,
              ),
            ],
          ),
          Image.asset("assets/images/logo.jpeg"),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                "assets/images/intropage2.jpeg",
                fit: BoxFit.fill,
                height: 150,
              ),
            ],
          ),
        ],
      )),
    );
  }
}
