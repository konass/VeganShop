
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_online_shop/pages/home_page.dart';

import '../theme/AppColors.dart';
class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }
  startTimer() async {
    var duration = Duration(seconds: 5);
    return Timer (duration, route);
  }
  route(){
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => HomePage()
    ));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset('assets/vegan_logo.jpg',),
            SizedBox(height: 40),
            const Text(
              'Plant world',
              style: TextStyle(
                fontSize: 36,
                color: AppColors.textColor,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold
              )
            ),
            SizedBox(height: 28,),
            const Text(
                'Vegan online store',
                style: TextStyle(
                    fontSize: 18,
                    color: AppColors.textColor,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.normal
                )
            ),
            SizedBox(height: 28,),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: AppColors.textColor,
              strokeWidth: 1,
            )
          ],
        )
      )
    );
  }
}

