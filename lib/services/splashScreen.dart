import 'dart:async';

import 'package:dspuiproject/services/home_page.dart';
import 'package:dspuiproject/services/home_page2.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setTimeout();
    //getPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
                stops: [
                  0.1,
                  1
                ],
                colors: [
                  new Color(0xffC57248),
                  new Color(0xffffffff),
                ])),
        child: Stack(
          //  new Color(0xff3ec7fd),new Color(0xff29dfb7)
          children: [
            Center(
              child: Container(
                height: 170,
                width: 250,
                child: Center(child: Image.asset('assets/logo.jpg')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void setTimeout() {
    Timer(
        const Duration(seconds: 3),
            () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => homepage2()));
        }
    );
  }
}
